# Ukrainian Academic Document Template
# Minimal build: LaTeX → PDF

# Default recipe - build PDF
default: build

# Compile LaTeX to PDF using LuaLaTeX + Biber
build:
    latexmk -lualatex -f main.tex
    mkdir -p pdf
    mv main.pdf pdf/

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

# Build in Docker (no local LaTeX needed)
docker-build:
    docker build -t ukrainian-latex .
    docker run --rm -v "$(pwd)/pdf:/output" ukrainian-latex

# Show available commands
help:
    @echo "Commands:"
    @echo "  just build        - Compile LaTeX to PDF"
    @echo "  just docker-build - Build in Docker (no local LaTeX)"
    @echo "  just clean        - Remove build artifacts"
    @echo "  just open         - Open PDF in viewer"
    @echo "  just watch        - Auto-rebuild on changes"
    @echo "  just view         - Build and open"
