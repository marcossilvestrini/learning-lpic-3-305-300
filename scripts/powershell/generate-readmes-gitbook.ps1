# Unified script: split README.md -> docs/*.md + SUMMARY.md + .gitbook.yaml
# Fix: Accepts H2 with emojis/symbols by normalizing headings before matching.
# Author: Marcos Silvestrini + Linux Specialist AI

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ---- Paths
$scriptPath   = $MyInvocation.MyCommand.Definition
$scriptDir    = Split-Path -Parent $scriptPath
$projectRoot  = (Resolve-Path (Join-Path $scriptDir '..\..')).Path
$destinationDir = Join-Path $projectRoot 'docs'
$summaryPath    = Join-Path $projectRoot 'SUMMARY.md'
$gitbookYamlPath= Join-Path $projectRoot '.gitbook.yaml'
$sourceFile     = Join-Path $projectRoot 'README.md'

# ---- Supported H2 titles (governance)
$validTitles = @(
  'Summary',
  'About Project',
  'Getting Started',
  'Usage',
  'Roadmap',
  'Four Essential Freedoms',
  'Inspect commands',
  'Topic 351: Full Virtualization',
  'Topic 352: Container Virtualization',
  'Topic 353: VM Deployment and Provisioning',
  'Contributing',
  'License',
  'Contact',
  'Acknowledgments'
)

function Get-SafeFileName {
  param([Parameter(Mandatory)][string]$Name)
  $invalid = [IO.Path]::GetInvalidFileNameChars() + [char]':'
  $safe = ($Name -replace "[$([Regex]::Escape(($invalid -join '')))]", '')
  return ($safe -replace '\s+', '')
}

function Remove-StrangeChars {
  param([Parameter(Mandatory)][string]$Text)
  $clean = $Text
  # Strip BOM if any
  if ($clean.Length -gt 0 -and [int]$clean[0] -eq 0xFEFF) { $clean = $clean.Substring(1) }
  # Remove zero-width and stray BOMs in body  
  $clean = $clean -replace "`u{200B}",''
  $clean = $clean -replace "`u{FEFF}",''
  # Normalize line-endings
  $clean = $clean -replace "`r`n","`n" -replace "`r","`n"
  return $clean
}

function Normalize-Title {
  <#
    Normaliza H2 para comparação com $validTitles:
    - Remove símbolos/emoji no INÍCIO do título (ex.: "🐳 ").
    - Colapsa espaços, lowercase.
  #>
  param([Parameter(Mandatory)][string]$S)
  $t = $S.Trim()

  # Remove prefixo não alfanumérico (emojis, símbolos)
  # Ex.: "## 🐳 Docker" -> "Docker"
  $t = $t -replace '^[^\p{L}\p{N}]+',''

  # Opcional: remova emojis/symbols remanescentes em todo o texto se quiser ser mais agressivo:
  # $t = $t -replace '[\p{Cs}\p{So}]',''

  # Colapsa espaços e força minúsculas
  $t = ($t -replace '\s+',' ').ToLowerInvariant()
  return $t
}

function Normalize-Whitelist {
  param([Parameter(Mandatory)][string[]]$Items)
  return $Items | ForEach-Object {
    ($_.Trim() -replace '\s+',' ').ToLowerInvariant()
  }
}

function Write-ContentUtf8 {
  param([Parameter(Mandatory)][string]$Path,
        [Parameter(Mandatory)][string]$Content)
  try { Set-Content -Path $Path -Value $Content -Encoding utf8NoBOM -Force }
  catch { Set-Content -Path $Path -Value $Content -Encoding UTF8 -Force }
}

function Get-SectionFileMapByNormalizedTitle {
  param([Parameter(Mandatory)][object[]]$Sections)
  $map = @{}
  foreach ($section in $Sections) {
    $normTitle = Normalize-Title -S $section.Title
    $map[$normTitle] = $section.File
  }
  return $map
}

function Resolve-SummaryAnchorTarget {
  param(
    [Parameter(Mandatory)][string]$Anchor,
    [Parameter(Mandatory)][hashtable]$FilesByNormTitle
  )

  $a = $Anchor.ToLowerInvariant()
  $gettingStarted = $FilesByNormTitle['getting started']
  $topic351 = $FilesByNormTitle['topic 351: full virtualization']
  $topic352 = $FilesByNormTitle['topic 352: container virtualization']
  $topic353 = $FilesByNormTitle['topic 353: vm deployment and provisioning']

  switch -Regex ($a) {
    '^about-the-project$' { return $FilesByNormTitle['about project'] }
    '^getting-started$'   { return $gettingStarted }
    '^prerequisites$'     { if ($gettingStarted) { return "$gettingStarted#prerequisites" } }
    '^installation$'      { if ($gettingStarted) { return "$gettingStarted#installation" } }
    '^usage$'             { return $FilesByNormTitle['usage'] }
    '^roadmap$'           { return $FilesByNormTitle['roadmap'] }
    '^freedoms$'          { return $FilesByNormTitle['four essential freedoms'] }
    '^topic-351$'         { return $topic351 }
    '^topic-351\.\d+$'    { if ($topic351) { return "$topic351#$a" } }
    '^topic-352$'         { return $topic352 }
    '^topic-352\.\d+$'    { if ($topic352) { return "$topic352#$a" } }
    '^topic-353$'         { return $topic353 }
    '^topic-353\.\d+$'    { if ($topic353) { return "$topic353#$a" } }
    '^license$'           { return $FilesByNormTitle['license'] }
    '^contact$'           { return $FilesByNormTitle['contact'] }
    '^acknowledgments$'   { return $FilesByNormTitle['acknowledgments'] }
    default               { return $null }
  }
}

function Repair-SummaryTocLinks {
  param(
    [Parameter(Mandatory)][string]$SummarySectionPath,
    [Parameter(Mandatory)][object[]]$Sections
  )

  if (-not (Test-Path -Path $SummarySectionPath)) { return }

  $filesByNorm = Get-SectionFileMapByNormalizedTitle -Sections $Sections
  $content = Get-Content -Path $SummarySectionPath -Raw -Encoding UTF8

  $updated = [Regex]::Replace($content, 'href="#([^"]+)"', {
    param($m)
    $anchor = $m.Groups[1].Value
    $target = Resolve-SummaryAnchorTarget -Anchor $anchor -FilesByNormTitle $filesByNorm
    if ([string]::IsNullOrWhiteSpace($target)) {
      return $m.Value
    }
    return "href=""$target"""
  })

  if ($updated -ne $content) {
    Write-ContentUtf8 -Path $SummarySectionPath -Content $updated
    Write-Host "[DEBUG] Summary TOC links fixed: $SummarySectionPath"
  }
}

function Invoke-ReadmeForcedSplit {
  param(
    [Parameter(Mandatory)][string]$SourceFile,
    [Parameter(Mandatory)][string]$DestinationDir,
    [ref]$SectionRefs
  )

  $raw = Get-Content -Path $SourceFile -Raw -Encoding UTF8
  $raw = Remove-StrangeChars -Text $raw
  $lines = $raw -split "`n"

  $normalizedWhitelist = Normalize-Whitelist -Items $validTitles
  $titleLines = New-Object System.Collections.Generic.List[object]

  for ($i=0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i].Trim()
    if ($line -match '^\#\#\s+(.+)$') {
      $originalTitle = $Matches[1].Trim()
      $normTitle = Normalize-Title -S $originalTitle
      if ($normalizedWhitelist -contains $normTitle) {
        $titleLines.Add([pscustomobject]@{ Line=$i; Title=$originalTitle; Norm=$normTitle })
      }
    }
  }

  if ($titleLines.Count -eq 0) {
    Write-Warning "No valid H2 sections matched whitelist (after normalization)."
    return
  }

  for ($i=0; $i -lt $titleLines.Count; $i++) {
    $start = $titleLines[$i].Line
    $end   = if ($i -lt $titleLines.Count-1) { $titleLines[$i+1].Line - 1 } else { $lines.Count - 1 }
    $title = $titleLines[$i].Title

    $slice = $lines[$start..$end]

    # Ajuste de caminhos relativos (case-insensitive), com grupos de captura corretos
    $contentFixed = $slice | ForEach-Object {
      $_ `
      -ireplace '!\[([^\]]*)\]\((?<!\.\./)images/', '![\$1](../images/' `
      -ireplace '\[([^\]]+)\]\((?<!\.\./)scripts/', '[\$1](../scripts/' `
      -ireplace '\[([^\]]+)\]\((?<!\.\./)vagrant/', '[\$1](../vagrant/' `
      -ireplace '\[([^\]]+)\]\((?<!\.\./)configs/', '[\$1](../configs/'
    }

    # Promove H2 -> H1 na primeira linha do arquivo extraído
    if ($contentFixed.Count -gt 0 -and $contentFixed[0] -match '^\s*##\s+') {
      $contentFixed[0] = ($contentFixed[0] -replace '^\s*##\s+', '# ')
    }

    $safeName = Get-SafeFileName -Name $title
    $outPath  = Join-Path $DestinationDir "$safeName.md"
    Write-ContentUtf8 -Path $outPath -Content ($contentFixed -join "`n")
    Write-Host "[DEBUG] Generated file: $outPath"
    $SectionRefs.Value += @{ Title = $title; File = "$safeName.md" }
  }
}

# ---- Prepare out folder
if (Test-Path $destinationDir) {
  Remove-Item -Path $destinationDir -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $destinationDir | Out-Null

Write-Host "[DEBUG] Processing: $sourceFile"
$sections = @()
Invoke-ReadmeForcedSplit -SourceFile $sourceFile -DestinationDir $destinationDir -SectionRefs ([ref]$sections)
Write-Host "README.md processed successfully."

# ---- Fix TOC links in generated docs Summary section
$summarySection = $sections | Where-Object { (Normalize-Title -S $_.Title) -eq 'summary' } | Select-Object -First 1
if ($summarySection) {
  $summarySectionPath = Join-Path $destinationDir $summarySection.File
  Repair-SummaryTocLinks -SummarySectionPath $summarySectionPath -Sections $sections
}

# ---- Generate SUMMARY.md
$summaryLines = @('# Summary', '')
foreach ($s in $sections) { $summaryLines += "- [$($s.Title)](docs/$($s.File))" }
Write-ContentUtf8 -Path $summaryPath -Content ($summaryLines -join "`r`n")
Write-Host "[DEBUG] SUMMARY.md generated: $summaryPath"

# ---- Generate .gitbook.yaml
$gitbookYaml = @"
root: docs
title: "LPIC 305-300"
description: "Study guide for LPIC-3 Virtualization certification"
language: "en"
structure:
  summary: ../SUMMARY.md
"@
Write-ContentUtf8 -Path $gitbookYamlPath -Content $gitbookYaml
Write-Host "[DEBUG] .gitbook.yaml generated: $gitbookYamlPath"
