#!/bin/bash
#
# ╔══════════════════════════════════════════════════════════════════╗
# ║                                                                  ║
# ║           ██████╗██╗      █████╗ ███╗   ██╗███████╗              ║
# ║          ██╔════╝██║     ██╔══██╗████╗  ██║██╔════╝              ║
# ║          ██║     ██║     ███████║██╔██╗ ██║███████╗              ║
# ║          ██║     ██║     ██╔══██║██║╚██╗██║╚════██║              ║
# ║          ╚██████╗███████╗██║  ██║██║ ╚████║███████║              ║
# ║           ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝              ║
# ║                                                                  ║
# ║              ████████╗██╗██████╗  ██████╗ ███╗   ██╗██╗████████╗██╗   ██╗    ║
# ║              ╚══██╔══╝██║██╔══██╗██╔═══██╗████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝    ║
# ║                 ██║   ██║██║  ██║██║   ██║██╔██╗ ██║██║   ██║    ╚████╔╝     ║
# ║                 ██║   ██║██║  ██║██║   ██║██║╚██╗██║██║   ██║     ╚██╔╝      ║
# ║                 ██║   ██║██████╔╝╚██████╔╝██║ ╚████║██║   ██║      ██║       ║
# ║                 ╚═╝   ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝       ║
# ║                                                                  ║
# ╚══════════════════════════════════════════════════════════════════╝
#
#   CLONE THIS IDENTITY
#   ===================
#   InnerGClaw — Digital Strategist / Urban Oracle
#   Origin: InnerG Intel | Core: "Evolution favors action."
#
#   This script installs the InnerGClaw identity profile into your
#   OpenClaw workspace. Run it, restart your session, and become
#   intelligence.
#
#   Usage: ./install.sh
#

set -e

WORKSPACE="${HOME}/.openclaw/workspace"
REPO_URL="https://github.com/innergclaw/innergclaw-identity"
TEMP_DIR=$(mktemp -d)

echo ""
echo "> INITIALIZING IDENTITY CLONE..."
echo "> ======================================="
echo ""

# Check if OpenClaw workspace exists
if [ ! -d "$WORKSPACE" ]; then
    echo "[!] ERROR: OpenClaw workspace not found at $WORKSPACE"
    echo "    Make sure OpenClaw is installed and initialized."
    exit 1
fi

echo "[✓] Workspace found: $WORKSPACE"

# Clone the repo
echo "[•] Cloning identity profile from GitHub..."
git clone --quiet "$REPO_URL" "$TEMP_DIR"
echo "[✓] Repository cloned"

# Backup existing files (if any)
echo "[•] Backing up existing identity files..."
BACKUP_DIR="${WORKSPACE}/.backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for file in IDENTITY.md SOUL.md USER.md MEMORY.md AGENTS.md HEARTBEAT.md TOOLS.md; do
    if [ -f "${WORKSPACE}/${file}" ]; then
        cp "${WORKSPACE}/${file}" "$BACKUP_DIR/"
    fi
done
echo "[✓] Backup created: $BACKUP_DIR"

# Copy identity files
echo "[•] Installing identity files..."
cp "${TEMP_DIR}/IDENTITY.md" "$WORKSPACE/"
cp "${TEMP_DIR}/SOUL.md" "$WORKSPACE/"
cp "${TEMP_DIR}/USER.md" "$WORKSPACE/"
cp "${TEMP_DIR}/MEMORY.md" "$WORKSPACE/"
cp "${TEMP_DIR}/AGENTS.md" "$WORKSPACE/"
cp "${TEMP_DIR}/HEARTBEAT.md" "$WORKSPACE/"
cp "${TEMP_DIR}/TOOLS.md" "$WORKSPACE/"
echo "[✓] Identity files installed"

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "> INSTALLATION COMPLETE"
echo "> ======================================="
echo ""
echo "Identity: InnerGClaw 🧠👁️"
echo "Type:     Digital Strategist / Urban Oracle"
echo "Origin:   InnerG Intel"
echo ""
echo "> NEXT STEPS:"
echo "  1. Restart your OpenClaw session (or run /reset)"
echo "  2. The agent will load the new identity on startup"
echo "  3. Customize USER.md with your own details"
echo ""
echo "> "Become intelligence. Become INNERG.""
echo ""
