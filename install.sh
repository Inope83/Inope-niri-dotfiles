#!/bin/bash

# Niri Dotfiles Installer for Fedora
# ====================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installing Niri Dotfiles...${NC}"

# Backup existing configs
echo -e "${BLUE}📦 Backing up existing configs...${NC}"
for dir in niri waybar kitty; do
    if [ -d "$HOME/.config/$dir" ]; then
        mv "$HOME/.config/$dir" "$HOME/.config/${dir}.bak.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}  ✓ Backed up $dir${NC}"
    fi
done

# Copy configurations
echo -e "${BLUE}📁 Copying configurations...${NC}"
cp -r .config/niri ~/.config/
cp -r .config/waybar ~/.config/
cp -r .config/kitty ~/.config/ 2>/dev/null || true
cp -r .config/wal ~/.config/ 2>/dev/null || true

# Copy scripts
echo -e "${BLUE}🔧 Installing scripts...${NC}"
mkdir -p ~/.local/bin
cp .local/bin/* ~/.local/bin/ 2>/dev/null || true
chmod +x ~/.local/bin/* 2>/dev/null || true

# Install dependencies
echo -e "${BLUE}📦 Installing dependencies...${NC}"
sudo dnf install -y niri waybar kitty swww pywal rofi fuzzel

# Reload Niri
echo -e "${BLUE}🔄 Reloading Niri...${NC}"
touch ~/.config/niri/config.kdl

echo -e "${GREEN}✅ Installation complete!${NC}"
echo -e "${GREEN}   Press Mod+Shift+B to see keybindings${NC}"
