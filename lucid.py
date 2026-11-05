#!/usr/bin/env python3
"""Fill in every file in templates/ with the colors from palettes/.

    {{name}}       →  #rrggbb
    {{name.hex}}   →  rrggbb
    {{name.rgb}}   →  r, g, b     (decimal, for rgba(...) with transparency)

A template with {{variant}} in its file name is rendered once per palette,
and {{variant}} becomes the palette's name:

    templates/extras/foot/lucid-{{variant}}.ini  →  extras/foot/lucid-dark.ini
                                                     extras/foot/lucid-light.ini

Any other template is rendered once, and names each palette's colors with
the palette's name in front: {{dark.bg}}, {{light.bg.hex}}. That's for
programs that keep both variants in one file.

Needs Python 3.11 or newer; no packages.
"""

import re
import sys
import tomllib
from pathlib import Path

root = Path(__file__).resolve().parent
placeholder = re.compile(r"\{\{\s*([a-z][a-z0-9_.]*?)(\.hex|\.rgb)?\s*\}\}")


def fill(text, colors, where):
    def one(match):
        name, form = match.groups()
        if name not in colors:
            sys.exit(f"unknown name '{name}' in {where}")
        value = colors[name]
        if form == ".hex":
            return value[1:]
        if form == ".rgb":
            return ", ".join(str(int(value[i:i + 2], 16)) for i in (1, 3, 5))
        return value

    return placeholder.sub(one, text)


def render(template, colors):
    path = str(template.relative_to(root / "templates"))
    output = root / fill(path, colors, path)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(fill(template.read_text(), colors, f"templates/{path}"))
    print(output.relative_to(root))


palettes = {}
for palette_file in sorted((root / "palettes").glob("*.toml")):
    palette = tomllib.loads(palette_file.read_text())
    colors = dict(palette["colors"])
    for key, value in palette["terminal"].items():
        colors[key] = colors.get(value, value)  # a color name or a hex value
    colors["variant"] = palette_file.stem
    palettes[palette_file.stem] = colors

every = {f"{variant}.{name}": value
         for variant, colors in palettes.items() for name, value in colors.items()}

for template in sorted((root / "templates").rglob("*")):
    if not template.is_file():
        continue
    if "{{variant}}" in template.name:
        for colors in palettes.values():
            render(template, colors)
    else:
        render(template, every)
