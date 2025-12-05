# Minimal LaTeX build environment
FROM texlive/texlive:latest

# Install Liberation fonts (Times New Roman alternative)
RUN apt-get update && apt-get install -y fonts-liberation && rm -rf /var/lib/apt/lists/*

WORKDIR /doc

# Copy project files
COPY . .

# Build PDF
RUN latexmk -lualatex -f main.tex && mkdir -p pdf && mv main.pdf pdf/

# Default: copy PDF to mounted output
CMD ["cp", "pdf/main.pdf", "/output/"]
