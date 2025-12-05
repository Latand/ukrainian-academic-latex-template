# Ukrainian Academic Document Template
# Build commands for LaTeX compilation

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
    xdg-open pdf/main.pdf

# Watch for changes and rebuild automatically
watch:
    latexmk -lualatex -pvc main.tex

# Build and open
view: build open
