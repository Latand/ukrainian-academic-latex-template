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
docx: build
    @echo "Converting to DOCX..."
    pandoc main.tex -o pdf/main.docx \
        --bibliography=refs.bib \
        --citeproc \
        -f latex \
        -t docx
    @echo "Created: pdf/main.docx"

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
    @echo "  just build  - Compile LaTeX to PDF"
    @echo "  just docx   - Convert to Word document"
    @echo "  just clean  - Remove build artifacts"
    @echo "  just open   - Open PDF in viewer"
    @echo "  just watch  - Auto-rebuild on changes"
    @echo "  just view   - Build and open"
    @echo "  just setup  - Install dependencies"
