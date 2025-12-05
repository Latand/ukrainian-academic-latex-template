# Ukrainian Academic LaTeX Template

A LaTeX template for Ukrainian academic documents: essays, reports, and dissertations.

## Features

- Ukrainian language support with proper fonts (Times New Roman, 14pt)
- 1.5 line spacing, 25mm margins (Ukrainian academic standards)
- Modular structure: separate files for chapters
- Bibliography support with BibLaTeX + Biber
- Easy build with `just` command runner

## Quick Start

1. **Clone or copy** this template
2. **Edit metadata** in `main.tex`:
   ```latex
   \thesistitle{Your Document Title}
   \author{Your Name}
   \supervisor{Supervisor Name and Title}
   \university{University Name}
   ```
3. **Build PDF**:
   ```bash
   just build
   ```

## Prerequisites

- **TeX Live** (full installation recommended) or **MiKTeX**
- **LuaLaTeX** (included in TeX Live)
- **Biber** (for bibliography processing)
- **Just** command runner: `cargo install just` or via package manager
- **Times New Roman** font installed on your system

### Installing on Ubuntu/Debian

```bash
sudo apt install texlive-full biber fonts-liberation
cargo install just
```

### Installing on Arch Linux

```bash
sudo pacman -S texlive-full biber ttf-liberation
sudo pacman -S just
```

## File Structure

```
├── main.tex                 # Entry point - edit metadata here
├── UkrainianAcademic.cls    # Document class - edit formatting here
├── refs.bib                 # Bibliography - add sources here
├── justfile                 # Build commands
├── frontmatter/
│   ├── titlepage.tex        # Title page layout
│   ├── abstract_ua.tex      # Ukrainian abstract
│   ├── abstract_en.tex      # English abstract
│   └── abbreviations.tex    # Terminology list
├── chapters/
│   ├── introduction.tex     # Introduction (unnumbered)
│   ├── chapter1.tex         # First chapter (numbered)
│   └── conclusions.tex      # Conclusions (unnumbered)
├── images/                  # Place figures here
└── pdf/                     # Output PDF goes here
```

## Build Commands

| Command | Description |
|---------|-------------|
| `just build` | Compile to PDF |
| `just clean` | Remove build artifacts |
| `just open` | Open PDF in viewer |
| `just watch` | Auto-rebuild on changes |
| `just view` | Build and open |

## Customization

### Adding Chapters

1. Create `chapters/chapter2.tex`
2. Add to `main.tex`:
   ```latex
   \input{chapters/chapter2}
   ```

### Changing Margins

Edit `UkrainianAcademic.cls`, find the `% === MARGINS ===` section:
```latex
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
}
```

### Changing Font Size

Edit `UkrainianAcademic.cls`, find the `% === FONT SIZES ===` section.
Base size is 14pt (Ukrainian standard).

### Adding Bibliography

Add entries to `refs.bib`:
```bibtex
@book{mybook,
  author = {Author Name},
  title = {Book Title},
  year = {2024},
  publisher = {Publisher},
}
```

Cite in text: `\cite{mybook}`

## Using with LLM (Claude Code)

This template is designed for LLM-assisted writing. See `.claude/CLAUDE.md` for instructions on how Claude Code can help edit this document.

Typical workflow:
1. Tell Claude what content you need
2. Claude edits the appropriate chapter file
3. Run `just build` to compile
4. Review PDF and iterate

## Troubleshooting

**Error: Font not found**
- Install Times New Roman or change font in `UkrainianAcademic.cls`

**Bibliography not appearing**
- Run `just build` twice (first pass creates .bbl, second includes it)

**Ukrainian text looks wrong**
- Make sure you're using LuaLaTeX, not pdfLaTeX

## License

MIT License - see LICENSE file
