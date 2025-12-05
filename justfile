# Ukrainian Academic Document Template
# Build commands for LaTeX compilation and conversion

# Default recipe - build PDF
default: build

# Compile LaTeX to PDF using LuaLaTeX + Biber
build:
    latexmk -lualatex -f main.tex
    mkdir -p pdf
    mv main.pdf pdf/

# Convert to Word document (.docx) using Pandoc
# NOTE: Pandoc conversion is limited - complex formatting will be lost
# For best results, use PDF as primary output or convert PDF via LibreOffice
docx: build
    @echo "Converting to DOCX (basic content only)..."
    @echo "NOTE: Complex formatting will be lost. Use PDF for proper layout."
    pandoc main.tex -o pdf/main.docx \
        --bibliography=refs.bib \
        --citeproc \
        -f latex \
        -t docx
    @echo "Created: pdf/main.docx"

# Convert PDF to DOCX via LibreOffice (better quality)
docx-libreoffice: build
    #!/bin/bash
    if ! command -v libreoffice &> /dev/null; then
        echo "ERROR: LibreOffice not installed."
        echo "Install with: sudo apt install libreoffice  (Debian/Ubuntu)"
        echo "          or: sudo pacman -S libreoffice    (Arch)"
        echo "          or: brew install --cask libreoffice (macOS)"
        exit 1
    fi
    echo "Converting PDF to DOCX via LibreOffice..."
    libreoffice --headless --convert-to docx --outdir pdf pdf/main.pdf
    echo "Created: pdf/main.docx"

# Clean all build artifacts
clean:
    latexmk -C main.tex
    rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc *.fls *.fdb_latexmk *.synctex.gz

# Open PDF in default viewer
open:
    @if [ "$(uname)" = "Darwin" ]; then \
        open pdf/main.pdf; \
    elif [ "$(uname)" = "Linux" ]; then \
        xdg-open pdf/main.pdf; \
    else \
        start pdf/main.pdf; \
    fi

# Watch for changes and rebuild automatically
watch:
    latexmk -lualatex -pvc main.tex

# Build and open
view: build open

# Run setup script to install dependencies
setup:
    @chmod +x setup.sh
    @./setup.sh

# Show available commands
help:
    @echo "Available commands:"
    @echo "  just build           - Compile LaTeX to PDF (recommended)"
    @echo "  just docx            - Convert to DOCX via Pandoc (basic)"
    @echo "  just docx-libreoffice - Convert PDF to DOCX via LibreOffice (better)"
    @echo "  just clean           - Remove build artifacts"
    @echo "  just open            - Open PDF in viewer"
    @echo "  just watch           - Auto-rebuild on changes"
    @echo "  just view            - Build and open"
    @echo "  just setup           - Install dependencies"
    @echo ""
    @echo "Note: DOCX conversion loses formatting. Use PDF as primary output."
