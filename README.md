# Ukrainian Academic LaTeX Template

LaTeX template for Ukrainian academic documents with Claude Code integration.

## Quick Start

### Option 1: Docker (no install needed)
```bash
just docker-build
```

### Option 2: Local LaTeX
```bash
# Install LaTeX
sudo apt install texlive-full just  # Debian/Ubuntu
sudo pacman -S texlive-full just    # Arch
brew install --cask mactex && brew install just  # macOS

# Build
just build
```

## Commands

```
just build        - Compile to PDF (local LaTeX)
just docker-build - Compile to PDF (Docker)
just clean        - Remove build artifacts
just open         - Open PDF in viewer
just watch        - Auto-rebuild on changes
just view         - Build and open
```

## Structure

```
main.tex                 # Entry point - edit metadata
UkrainianAcademic.cls    # Document class - edit formatting
refs.bib                 # Bibliography
frontmatter/             # Title page, abstracts
chapters/                # Document content
pdf/                     # Output
```

## Configuration

Edit `main.tex`:
```latex
\thesistitle{Назва документа}
\author{Прізвище І.П.}
\supervisor{д.т.н., проф. Прізвище І.П.}
\university{Назва університету}
\faculty{Назва факультету}
\department{Назва кафедри}
```

## Using with Claude Code

```bash
claude  # Start Claude Code in project directory
```

Ask Claude to edit chapters, add content, fix formatting. See `.claude/CLAUDE.md` for details.

## License

MIT
