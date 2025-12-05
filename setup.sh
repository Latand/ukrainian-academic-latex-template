#!/bin/bash
# ===============================================================
#  Ukrainian Academic LaTeX Template - Setup Script
#  Installs all dependencies for document compilation and conversion
# ===============================================================

set -e

echo "=========================================="
echo "Ukrainian Academic LaTeX Template Setup"
echo "=========================================="
echo ""

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            echo "debian"
        elif command -v pacman &> /dev/null; then
            echo "arch"
        elif command -v dnf &> /dev/null; then
            echo "fedora"
        else
            echo "linux"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        echo "windows"
    else
        echo "unknown"
    fi
}

OS=$(detect_os)
echo "Detected OS: $OS"
echo ""

# Step 1: Install Bun
echo "[1/4] Installing Bun..."
if command -v bun &> /dev/null; then
    echo "  ✓ Bun already installed ($(bun --version))"
else
    curl -fsSL https://bun.sh/install | bash
    # Source the new PATH
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    echo "  ✓ Bun installed"
fi
echo ""

# Step 2: Install Claude Code
echo "[2/4] Installing Claude Code..."
if command -v claude &> /dev/null; then
    echo "  ✓ Claude Code already installed"
else
    # Try Bun first, fall back to native installer
    if command -v bun &> /dev/null; then
        bun install -g @anthropic-ai/claude-code
        echo "  ✓ Claude Code installed via Bun"
    else
        curl -fsSL https://claude.ai/install.sh | bash
        echo "  ✓ Claude Code installed via native installer"
    fi
fi
echo ""

# Step 3: Install LaTeX and tools
echo "[3/4] Installing LaTeX, Biber, Pandoc, and Just..."
echo "  (This may take a while and require sudo password)"
echo ""

case $OS in
    debian)
        echo "  Installing for Debian/Ubuntu..."
        sudo apt update
        sudo apt install -y texlive-full biber pandoc fonts-liberation just unzip
        ;;
    arch)
        echo "  Installing for Arch Linux..."
        sudo pacman -S --noconfirm texlive-full biber pandoc ttf-liberation just unzip
        ;;
    fedora)
        echo "  Installing for Fedora..."
        sudo dnf install -y texlive-scheme-full biber pandoc liberation-fonts-common just unzip
        ;;
    macos)
        echo "  Installing for macOS..."
        if ! command -v brew &> /dev/null; then
            echo "  Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install --cask mactex
        brew install biber pandoc just
        ;;
    windows)
        echo "  Windows detected. Please install manually:"
        echo "    - MiKTeX: https://miktex.org/download"
        echo "    - Pandoc: https://pandoc.org/installing.html"
        echo "    - Just: winget install Casey.Just"
        ;;
    *)
        echo "  Unknown OS. Please install manually:"
        echo "    - TeX Live: https://tug.org/texlive/"
        echo "    - Pandoc: https://pandoc.org/"
        echo "    - Just: https://just.systems/"
        ;;
esac
echo ""

# Step 4: Verify installation
echo "[4/4] Verifying installation..."
echo ""

check_command() {
    if command -v $1 &> /dev/null; then
        echo "  ✓ $1 installed"
        return 0
    else
        echo "  ✗ $1 NOT found"
        return 1
    fi
}

ERRORS=0
check_command bun || ERRORS=$((ERRORS+1))
check_command claude || ERRORS=$((ERRORS+1))
check_command lualatex || ERRORS=$((ERRORS+1))
check_command biber || ERRORS=$((ERRORS+1))
check_command pandoc || ERRORS=$((ERRORS+1))
check_command just || ERRORS=$((ERRORS+1))

echo ""
echo "=========================================="
if [ $ERRORS -eq 0 ]; then
    echo "✓ All dependencies installed successfully!"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your terminal (or run: source ~/.bashrc)"
    echo "  2. cd into your project directory"
    echo "  3. Run: just build"
    echo ""
    echo "To start Claude Code:"
    echo "  claude"
else
    echo "⚠ Some dependencies could not be installed."
    echo "  Please install them manually."
fi
echo "=========================================="
