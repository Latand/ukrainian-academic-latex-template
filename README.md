# Ukrainian Academic LaTeX Template

A LaTeX template for Ukrainian academic documents: essays, reports, and dissertations.

## Features

- Ukrainian language support with proper fonts (Times New Roman, 14pt)
- 1.5 line spacing, 25mm margins (Ukrainian academic standards)
- Modular structure: separate files for chapters
- Bibliography support with BibLaTeX + Biber
- PDF and DOCX output
- Easy build with `just` command runner
- Designed for LLM-assisted writing with Claude Code

## Quick Start

### 1. Install Everything (One Command)

```bash
# Run the setup script
curl -fsSL https://raw.githubusercontent.com/user/ukrainian-academic-latex-template/main/setup.sh | bash
```

Or manually install step by step:

### 2. Manual Installation

#### Install Bun (All Platforms)

**macOS / Linux:**
```bash
curl -fsSL https://bun.sh/install | bash
```

**Windows (PowerShell):**
```powershell
powershell -c "irm bun.sh/install.ps1 | iex"
```

#### Install Claude Code

```bash
# Via Bun (recommended)
bun install -g @anthropic-ai/claude-code

# Or via native installer
curl -fsSL https://claude.ai/install.sh | bash
```

#### Install LaTeX and Tools

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install -y texlive-full biber pandoc fonts-liberation just
```

**Arch Linux:**
```bash
sudo pacman -S texlive-full biber pandoc ttf-liberation just
```

**macOS:**
```bash
brew install --cask mactex
brew install biber pandoc just
```

**Windows:**
- Install [MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/)
- Install [Pandoc](https://pandoc.org/installing.html)
- Install Just: `winget install Casey.Just`

### 3. Clone and Build

```bash
git clone https://github.com/user/ukrainian-academic-latex-template.git
cd ukrainian-academic-latex-template

# Edit metadata in main.tex, then:
just build
```

## Build Commands

| Command | Description |
|---------|-------------|
| `just build` | Compile to PDF (recommended) |
| `just docx` | Convert to Word via Pandoc (basic, loses formatting) |
| `just docx-libreoffice` | Convert PDF to Word via LibreOffice (better quality) |
| `just clean` | Remove build artifacts |
| `just open` | Open PDF in viewer |
| `just watch` | Auto-rebuild on changes |
| `just view` | Build and open |

> **Note:** DOCX conversion has limitations. Pandoc does shallow LaTeX parsing and loses complex formatting. For best results, use PDF as primary output. If you need DOCX, use `just docx-libreoffice` or online PDF converters.

## File Structure

```
├── main.tex                 # Entry point - edit metadata here
├── UkrainianAcademic.cls    # Document class - edit formatting here
├── refs.bib                 # Bibliography - add sources here
├── justfile                 # Build commands
├── setup.sh                 # One-command installer
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
└── pdf/                     # Output (PDF and DOCX)
```

## Using with Claude Code

This template is designed for LLM-assisted writing.

### Workflow

1. Start Claude Code in the project directory:
   ```bash
   claude
   ```

2. Tell Claude what content you need:
   ```
   Write an introduction about machine learning in education
   ```

3. Claude edits the appropriate chapter file

4. Build and review:
   ```bash
   just view
   ```

See `.claude/CLAUDE.md` for detailed editing instructions.

## Customization

### Adding Chapters

1. Create `chapters/chapter2.tex`
2. Add to `main.tex`:
   ```latex
   \input{chapters/chapter2}
   ```

### Changing Document Metadata

Edit `main.tex`:
```latex
\thesistitle{Your Document Title}
\author{Your Name}
\supervisor{Supervisor Name and Title}
\university{University Name}
\faculty{Faculty Name}
\department{Department Name}
```

### Changing Margins

Edit `UkrainianAcademic.cls`, find `% === MARGINS ===`:
```latex
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
}
```

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

## Troubleshooting

**Bun not found after installation**
- Restart your terminal or run `source ~/.bashrc`

**Claude Code authentication**
- Run `claude` and follow the login prompts
- Get API key from https://console.anthropic.com/

**Font not found**
- Install Times New Roman or Liberation fonts
- On Linux: `sudo apt install fonts-liberation`

**Bibliography not appearing**
- Run `just build` twice

**DOCX conversion looks bad**
- Pandoc cannot handle complex LaTeX formatting
- Use `just docx-libreoffice` for better results (requires LibreOffice)
- Or use online PDF to DOCX converters (Adobe, SmallPDF, etc.)
- Best practice: use PDF as primary format, DOCX only when required

## Requirements Summary

| Tool | Purpose | Install |
|------|---------|---------|
| [Bun](https://bun.sh) | Package manager | `curl -fsSL https://bun.sh/install \| bash` |
| [Claude Code](https://www.npmjs.com/package/@anthropic-ai/claude-code) | LLM assistant | `bun i -g @anthropic-ai/claude-code` |
| [TeX Live](https://tug.org/texlive/) | LaTeX compiler | `apt install texlive-full` |
| [Biber](https://github.com/plk/biber) | Bibliography | Included in TeX Live |
| [Pandoc](https://pandoc.org/) | Format conversion | `apt install pandoc` |
| [Just](https://just.systems/) | Task runner | `apt install just` |

## License

MIT License - see LICENSE file

## Sources

- [Bun Installation](https://bun.sh/docs/installation)
- [Claude Code npm](https://www.npmjs.com/package/@anthropic-ai/claude-code)
- [Pandoc User Guide](https://pandoc.org/MANUAL.html)
