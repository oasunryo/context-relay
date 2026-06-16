#!/bin/bash
set -e

# Target directory variables
ANTIGRAVITY_DIR="$HOME/.gemini/antigravity/scratch/.agents/skills/session-handover"
ROO_CLINE_DIR=".roo"
CURSOR_FILE=".cursorrules"

echo "========================================="
echo " AI Agent Context Relay Installer"
echo "========================================="
echo "Select where you want to install the handover configurations:"
echo "1) Antigravity Custom Skill (Global: ~/.gemini/...)"
echo "2) Cursor Rules (Project Root: .cursorrules)"
echo "3) Roo Code / Cline Custom Rules (Project Root: .roo/instructions.md)"
echo "4) Exit"
echo "========================================="
read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        echo "Installing to Antigravity..."
        mkdir -p "$ANTIGRAVITY_DIR"
        cp SKILL.md "$ANTIGRAVITY_DIR/SKILL.md"
        echo "Successfully installed to Antigravity Custom Skills!"
        ;;
    2)
        echo "Appending instructions to $CURSOR_FILE..."
        cat SKILL.md >> "$CURSOR_FILE"
        echo "Successfully added to $CURSOR_FILE!"
        ;;
    3)
        echo "Installing to Roo Code / Cline instructions..."
        mkdir -p "$ROO_CLINE_DIR"
        cp SKILL.md "$ROO_CLINE_DIR/instructions.md"
        echo "Successfully installed to $ROO_CLINE_DIR/instructions.md!"
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
