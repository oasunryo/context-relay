#!/bin/bash
set -e

# Target directory for antigravity custom skills
TARGET_DIR="$HOME/.gemini/antigravity/scratch/.agents/skills/session-handover"

echo "Installing Session Handover custom skill..."
mkdir -p "$TARGET_DIR"

# Copy skill file
cp SKILL.md "$TARGET_DIR/SKILL.md"

echo "Installation complete! Skill installed to $TARGET_DIR"
