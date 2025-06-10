# Script unificado: split de README.md + geração de SUMMARY.md + .gitbook.yaml (corrigido para rodar localmente e no GitHub Actions)

$scriptPath = $MyInvocation.MyCommand.Definition
$scriptDir = Split-Path -Parent $scriptPath
$projectRoot = Resolve-Path "$scriptDir\..\.." | Select-Object -ExpandProperty Path
$destinationDir = Join-Path $projectRoot "docs"
$summaryPath = Join-Path $projectRoot "SUMMARY.md"
$gitbookYamlPath = Join-Path $projectRoot ".gitbook.yaml"
$sourceFile = Join-Path $projectRoot "README.md"


# Títulos válidos
$validTitles = @(
    "Summary",
    "About Project",
    "Getting Started",
    "Usage",
    "Roadmap",
    "Four Essential Freedoms",
    "Inspect commands",
    "Topic 351: Full Virtualization",
    "Topic 352: Container Virtualization",
    "Topic 353: VM Deployment and Provisioning",
    "Contributing",
    "License",
    "Contact",
    "Acknowledgments"
)

function Get-SafeFileName {
    param([string]$name)
    $invalid = [System.IO.Path]::GetInvalidFileNameChars() + [char[]]":"
    $safe = ($name -replace "[$([RegEx]::Escape(($invalid -join '')))]", "")
    return ($safe -replace "\s+", "")
}

# Cleanup e criação do diretório
if (Test-Path -Path $destinationDir) {
    Remove-Item -Path $destinationDir -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $destinationDir | Out-Null

function Invoke-ReadmeForcedSplit {
    param (
        [string]$sourceFile,
        [string]$destinationDir,
        [ref]$sectionRefs
    )

    $lines = Get-Content -Path $sourceFile -Encoding UTF8
    if ($lines[0] -match "^﻿") {
        $lines[0] = $lines[0] -replace "^﻿", ""
    }

    $titleLines = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i].Trim()
        if ($line -match '^##\s+(.+)$') {
            $title = $Matches[1].Trim()
            foreach ($valid in $validTitles) {
                if (($title -replace '\s+', ' ').ToLower() -eq ($valid -replace '\s+', ' ').ToLower()) {
                    $titleLines += @{ Line = $i; Title = $title }
                    break
                }
            }
        }
    }

    for ($i = 0; $i -lt $titleLines.Count; $i++) {
        $start = $titleLines[$i].Line
        $end = if ($i -lt $titleLines.Count - 1) { $titleLines[$i + 1].Line - 1 } else { $lines.Count - 1 }
        $title = $titleLines[$i].Title

        # Ajuste de caminhos relativos
        $content = $lines[$start..$end] | ForEach-Object {
            $_ `
            -replace '!\[([^\]]*)\]\((?<!\.\./)images/', '![${1}](../images/' `
            -replace '\[([^\]]+)\]\((?<!\.\./)scripts/', '[${1}](../scripts/' `
            -replace '\[([^\]]+)\]\((?<!\.\./)vagrant/', '[${1}](../vagrant/'
        }

        # Altera título para H1
        if ($content[0] -match '^##\s+') {
            $content[0] = $content[0] -replace '^##\s+', '# '
        }

        $safeName = Get-SafeFileName $title
        $path = Join-Path $destinationDir "$safeName.md"
        Set-Content -Path $path -Value ($content -join "`n") -Encoding UTF8
        Write-Host "[DEBUG] Arquivo gerado: $path"
        $sectionRefs.Value += @{ Title = $title; File = "$safeName.md" }
    }
}

Write-Host "[DEBUG] Processando arquivo: $sourceFile"
$sections = @()
Invoke-ReadmeForcedSplit -sourceFile $sourceFile -destinationDir $destinationDir -sectionRefs ([ref]$sections)
Write-Host "Arquivo README.md foi processado com sucesso!"

# Gera SUMMARY.md
$summaryLines = @("# Summary", "")
foreach ($s in $sections) {
    $summaryLines += "- [$($s.Title)](docs/$($s.File))"
}
[System.IO.File]::WriteAllLines($summaryPath, $summaryLines, [System.Text.Encoding]::UTF8)
Write-Host "[DEBUG] SUMMARY.md gerado: $summaryPath"

# Gera .gitbook.yaml
$gitbookYaml = @"
root: docs
title: "LPIC 305-300"
description: "Study guide for LPIC-3 Virtualization certification"
language: "en"
structure:  
  summary: ../SUMMARY.md
"@
Set-Content -Path $gitbookYamlPath -Value $gitbookYaml -Encoding UTF8
Write-Host "[DEBUG] .gitbook.yaml gerado: $gitbookYamlPath"
