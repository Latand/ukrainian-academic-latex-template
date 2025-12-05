# Ukrainian Academic LaTeX Template

LaTeX template for Ukrainian academic documents with Claude Code integration.

> **Important**: This template requires **LuaLaTeX** (not pdfLaTeX). The build commands handle this automatically.

## Quick Start

### Option 1: Docker (no install needed)
```bash
just docker-run   # fast, mounts project
# or
just docker-build # slower, rebuilds image
```

### Option 2: Local LaTeX
```bash
# Install LaTeX, then:
just build
# or without Just:
latexmk -lualatex -f main.tex
```

## Installation

### 1. Install Bun

Bun is a fast JavaScript runtime. Install it first:

**macOS / Linux:**
```bash
curl -fsSL https://bun.sh/install | bash
```

**Windows (PowerShell):**
```powershell
irm bun.sh/install.ps1 | iex
```

Restart terminal after installation.

### 2. Install Claude Code

Claude Code is an AI coding assistant. Install via Bun:

```bash
bun install -g @anthropic-ai/claude-code
```

Or use the native installer (no Node.js required):
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Verify installation:
```bash
claude --version
```

### 3. Install LaTeX

**Ubuntu/Debian:**
```bash
sudo apt install texlive-full
```

**Arch:**
```bash
sudo pacman -S texlive-full
```

**macOS:**
```bash
brew install --cask mactex
```

**Windows:**
- Install [MiKTeX](https://miktex.org/download)

### 4. Install Just (optional)

[Just](https://just.systems) is a command runner. Optional but convenient.

```bash
# Ubuntu/Debian
sudo apt install just

# Arch
sudo pacman -S just

# macOS
brew install just

# Windows
winget install Casey.Just
```

## Commands

With Just:
```
just build        - Compile to PDF (local LaTeX)
just docker-run   - Compile in Docker (fast, mounts project)
just docker-build - Compile in Docker (rebuilds image)
just clean        - Remove build artifacts
just view         - Build and open PDF
just watch        - Auto-rebuild on changes
```

Without Just:
```bash
latexmk -lualatex -f main.tex && mkdir -p pdf && mv main.pdf pdf/
```

> **Note**: Run build twice if bibliography changes don't appear (latexmk usually handles this automatically).

## Project Structure

```
main.tex                 # Entry point - edit metadata
UkrainianAcademic.cls    # Document class - formatting
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
cd your-project
claude
```

Ask Claude to write content, add chapters, fix formatting. See `CLAUDE.md` for details.

## Sources

- [Bun Installation](https://bun.sh/docs/installation)
- [Claude Code Setup](https://code.claude.com/docs/en/setup)
- [Claude Code npm](https://www.npmjs.com/package/@anthropic-ai/claude-code)

## License

MIT
