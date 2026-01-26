#!/bin/bash
#
# LEGO Agent OS Installer
# Installs the full lego-agent-os framework into a target project
#
# Usage: ./scripts/install-lego-os.sh <target-directory> [--brand|--product|--minimal]
#
# Options:
#   --brand    Include brand strategy templates (default)
#   --product  Include product/engineering templates
#   --minimal  Only core .claude/ directory
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LEGO_OS_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default mode
MODE="brand"

# Parse arguments
TARGET_DIR=""
for arg in "$@"; do
    case $arg in
        --brand)
            MODE="brand"
            ;;
        --product)
            MODE="product"
            ;;
        --minimal)
            MODE="minimal"
            ;;
        *)
            TARGET_DIR="$arg"
            ;;
    esac
done

if [ -z "$TARGET_DIR" ]; then
    echo -e "${RED}Error: Target directory required${NC}"
    echo "Usage: $0 <target-directory> [--brand|--product|--minimal]"
    exit 1
fi

# Create target if it doesn't exist
mkdir -p "$TARGET_DIR"
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

echo -e "${GREEN}🧱 Installing LEGO Agent OS${NC}"
echo "   Source: $LEGO_OS_ROOT"
echo "   Target: $TARGET_DIR"
echo "   Mode:   $MODE"
echo ""

# Core installation (always)
echo -e "${YELLOW}→ Installing core .claude/ directory...${NC}"
cp -r "$LEGO_OS_ROOT/.claude" "$TARGET_DIR/"

echo -e "${YELLOW}→ Installing CLAUDE.base.md...${NC}"
cp "$LEGO_OS_ROOT/CLAUDE.base.md" "$TARGET_DIR/"

echo -e "${YELLOW}→ Installing templates...${NC}"
cp -r "$LEGO_OS_ROOT/templates" "$TARGET_DIR/"

echo -e "${YELLOW}→ Installing standards...${NC}"
cp -r "$LEGO_OS_ROOT/standards" "$TARGET_DIR/"

# Mode-specific installation
if [ "$MODE" = "brand" ] || [ "$MODE" = "product" ]; then
    echo -e "${YELLOW}→ Installing product templates...${NC}"
    cp -r "$LEGO_OS_ROOT/product-templates" "$TARGET_DIR/"
    
    echo -e "${YELLOW}→ Installing spec templates...${NC}"
    cp -r "$LEGO_OS_ROOT/spec-templates" "$TARGET_DIR/"
    
    echo -e "${YELLOW}→ Installing PRP templates...${NC}"
    cp -r "$LEGO_OS_ROOT/prp-templates" "$TARGET_DIR/"
fi

if [ "$MODE" = "product" ]; then
    echo -e "${YELLOW}→ Installing Ralph scripts...${NC}"
    mkdir -p "$TARGET_DIR/scripts"
    cp -r "$LEGO_OS_ROOT/scripts/ralph" "$TARGET_DIR/scripts/"
fi

# Create folder structure based on mode
if [ "$MODE" = "brand" ]; then
    echo -e "${YELLOW}→ Creating brand project structure...${NC}"
    mkdir -p "$TARGET_DIR/brand"
    mkdir -p "$TARGET_DIR/content"
    mkdir -p "$TARGET_DIR/marketing"
    mkdir -p "$TARGET_DIR/business"
    mkdir -p "$TARGET_DIR/ai-docs"
    
    # Create placeholder files
    if [ ! -f "$TARGET_DIR/brand/README.md" ]; then
        echo "# Brand Strategy

Brand discovery briefs, strategy documents, and identity systems.
" > "$TARGET_DIR/brand/README.md"
    fi
    
    if [ ! -f "$TARGET_DIR/content/README.md" ]; then
        echo "# Content

Content strategy, editorial calendar, and content assets.
" > "$TARGET_DIR/content/README.md"
    fi
    
    if [ ! -f "$TARGET_DIR/marketing/README.md" ]; then
        echo "# Marketing

Campaigns, GTM strategy, and marketing assets.
" > "$TARGET_DIR/marketing/README.md"
    fi
fi

if [ "$MODE" = "product" ]; then
    echo -e "${YELLOW}→ Creating product project structure...${NC}"
    mkdir -p "$TARGET_DIR/docs/specs"
    mkdir -p "$TARGET_DIR/docs/prps"
    mkdir -p "$TARGET_DIR/ai-docs"
    mkdir -p "$TARGET_DIR/src"
fi

# Create .gitignore if it doesn't exist
if [ ! -f "$TARGET_DIR/.gitignore" ]; then
    echo -e "${YELLOW}→ Creating .gitignore...${NC}"
    cat > "$TARGET_DIR/.gitignore" << 'EOF'
# Dependencies
node_modules/

# Environment
.env
.env.local
.env.*.local

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Build
dist/
build/
.next/

# Local settings (may contain API keys)
.claude/settings.local.json

# Logs
*.log
logs/
EOF
fi

# Create ai-docs README
if [ ! -f "$TARGET_DIR/ai-docs/README.md" ]; then
    echo "# AI Documentation

This folder contains curated codebase intelligence for AI agents.

## Files to Add

- \`architecture-overview.md\` - System design and boundaries
- \`domain-context.md\` - Business logic and terminology  
- \`patterns-and-conventions.md\` - Code patterns used
- \`common-pitfalls.md\` - Known gotchas and solutions

These files are loaded by agents before planning or investigation.
" > "$TARGET_DIR/ai-docs/README.md"
fi

echo ""
echo -e "${GREEN}✅ LEGO Agent OS installed successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. Run /brand-discovery or /product-discovery to start"
echo "  3. Check .claude/commands/ for available workflows"
echo ""
