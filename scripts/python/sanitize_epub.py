from __future__ import annotations

import re
import sys
import zipfile
from pathlib import Path


def sanitize_epub(source: Path, destination: Path) -> None:
    with zipfile.ZipFile(source, "r") as archive:
        entries = {name: archive.read(name) for name in archive.namelist()}

    invalid_images = set()
    for name, data in entries.items():
        if not name.lower().endswith((".jfif", ".svgz")):
            continue
        if name.lower().endswith(".jfif"):
            invalid_images.add(name)
        if name.lower().endswith(".svgz"):
            invalid_images.add(name)

    content_files = [
        name for name in entries
        if name.lower().endswith((".xhtml", ".html"))
        and not name.lower().endswith("nav.xhtml")
    ]
    available = set(entries) - invalid_images
    updated = {}

    for name in content_files:
        text = entries[name].decode("utf-8", errors="replace")
        seen: dict[str, int] = {}

        def unique_id(match: re.Match[str]) -> str:
            element_id = match.group(2)
            count = seen.get(element_id, 0) + 1
            seen[element_id] = count
            if count == 1:
                return match.group(0)
            return f'{match.group(1)}id="{element_id}-{count}"'

        text = re.sub(r'(<[^>]+\s)id="([^"]+)"', unique_id, text)

        def clean_image(match: re.Match[str]) -> str:
            tag = match.group(0)
            source = re.search(r'(?:src|href)="([^"]+)"', tag)
            if not source:
                return tag
            target = source.group(1).split("#", 1)[0]
            if target.lower().endswith((".jfif", ".svgz")):
                alt = re.search(r'alt="([^"]*)"', tag)
                return alt.group(1) if alt else "[image omitted]"
            return tag

        text = re.sub(r'<(?:img|image)\b[^>]*>', clean_image, text, flags=re.I)

        def clean_link(match: re.Match[str]) -> str:
            attrs = match.group(1)
            target = match.group(2).split("#", 1)[0]
            body = match.group(3)
            if target.endswith("/") or target.startswith("file:"):
                return body
            normalized = target.lstrip("/")
            if normalized and normalized not in available and not target.startswith(("http:", "https:", "#", "mailto:")):
                return body
            return match.group(0)

        text = re.sub(r'<a\b([^>]*href="([^"]+)"[^>]*)>([\s\S]*?)</a>', clean_link, text, flags=re.I)
        updated[name] = text.encode("utf-8")

    for name in list(entries):
        if not name.lower().endswith(".opf"):
            continue
        manifest = entries[name].decode("utf-8", errors="replace")
        for invalid in invalid_images:
            manifest = re.sub(rf'\s*<item\b[^>]*href="[^"]*{re.escape(Path(invalid).name)}"[^>]*/>\s*', "\n", manifest, flags=re.I)
        updated[name] = manifest.encode("utf-8")

    with zipfile.ZipFile(destination, "w") as output:
        for name, data in entries.items():
            if name in invalid_images:
                continue
            output.writestr(name, updated.get(name, data))


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("usage: sanitize_epub.py INPUT.epub OUTPUT.epub")
    sanitize_epub(Path(sys.argv[1]), Path(sys.argv[2]))
