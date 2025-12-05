#!/bin/bash
# Ukrainian Academic LaTeX Template - Setup
# Installs: Bun, Claude Code, TeX Live, Just

set -e

echo "=== Ukrainian Academic LaTeX Template ==="
echo ""

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null; then
        OS="debian"
    elif command -v pacman &> /dev/null; then
        OS="arch"
    elif command -v dnf &> /dev/null; then
        OS="fedora"
    else
        OS="linux"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    OS="unknown"
fi

echo "OS: $OS"
echo ""

# 1. Bun
echo "[1/3] Bun..."
if command -v bun &> /dev/null; then
    echo "  ✓ installed"
else
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    echo "  ✓ installed"
fi

# 2. Claude Code
echo "[2/3] Claude Code..."
if command -v claude &> /dev/null; then
    echo "  ✓ installed"
else
    ~/.bun/bin/bun install -g @anthropic-ai/claude-code
    echo "  ✓ installed"
fi

# 3. LaTeX + Just
echo "[3/3] LaTeX + Just..."
case $OS in
    debian)
        echo "  Run: sudo apt install texlive-full just"
        ;;
    arch)
        echo "  Run: sudo pacman -S texlive-full just"
        ;;
    fedora)
        echo "  Run: sudo dnf install texlive-scheme-full just"
        ;;
    macos)
        echo "  Run: brew install --cask mactex && brew install just"
        ;;
    *)
        echo "  Install TeX Live: https://tug.org/texlive/"
        echo "  Install Just: https://just.systems/"
        ;;
esac

echo ""
echo "=== Done ==="
echo "Restart terminal, then: just build"
