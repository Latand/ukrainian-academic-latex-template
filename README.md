# Ukrainian Academic LaTeX Template

LaTeX template for Ukrainian academic documents with Claude Code integration.

## Quick Start

### Option 1: Docker (no install needed)
```bash
just docker-build
```

### Option 2: Local LaTeX
```bash
# Install LaTeX + Just, then:
just build
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
sudo apt install texlive-full just
```

**Arch:**
```bash
sudo pacman -S texlive-full just
```

**macOS:**
```bash
brew install --cask mactex && brew install just
```

**Windows:**
- Install [MiKTeX](https://miktex.org/download)
- Install Just: `winget install Casey.Just`

## Commands

```
just build        - Compile to PDF (local LaTeX)
just docker-build - Compile to PDF (Docker)
just clean        - Remove build artifacts
just open         - Open PDF in viewer
just watch        - Auto-rebuild on changes
just view         - Build and open
```

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
