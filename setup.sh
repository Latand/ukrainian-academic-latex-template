#!/bin/bash
# Ukrainian Academic LaTeX Template - Setup
#
# This script installs Bun and Claude Code automatically.
# LaTeX and Just require sudo, so we only print instructions.

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

echo "Detected: $OS"
echo ""

# === AUTOMATIC: Bun ===
echo "[1/2] Installing Bun..."
if command -v bun &> /dev/null; then
    echo "  Already installed: $(bun --version)"
else
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    echo "  Installed successfully"
fi
echo ""

# === AUTOMATIC: Claude Code ===
echo "[2/2] Installing Claude Code..."
if command -v claude &> /dev/null; then
    echo "  Already installed"
else
    ~/.bun/bin/bun install -g @anthropic-ai/claude-code
    echo "  Installed successfully"
fi
echo ""

# === MANUAL: LaTeX + Just ===
echo "=== Manual steps required ==="
echo ""
echo "Install LaTeX and Just (requires sudo):"
echo ""

case $OS in
    debian)
        echo "  sudo apt install texlive-full"
        echo "  sudo apt install just  # optional"
        ;;
    arch)
        echo "  sudo pacman -S texlive-full"
        echo "  sudo pacman -S just  # optional"
        ;;
    fedora)
        echo "  sudo dnf install texlive-scheme-full"
        echo "  sudo dnf install just  # optional"
        ;;
    macos)
        echo "  brew install --cask mactex"
        echo "  brew install just  # optional"
        ;;
    *)
        echo "  TeX Live: https://tug.org/texlive/"
        echo "  Just: https://just.systems/"
        ;;
esac

echo ""
echo "=== Done ==="
echo ""
echo "After installing LaTeX, restart terminal and run:"
echo "  just build        # if Just installed"
echo "  latexmk -lualatex -f main.tex  # without Just"
