#!/bin/bash
#
# UXR No-Show Tracker - One-command launcher
# Usage: ./noshow.sh
#
# What it does:
#   1. git pull (sync latest data from team)
#   2. Opens the dashboard in your browser
#   3. When you close (Ctrl+C), commits & pushes changes
#

set -e

# Go to the script's directory
cd "$(dirname "$0")"

echo ""
echo "  📋 UXR No-Show Tracker"
echo "  ─────────────────────────"
echo ""

# Step 1: Pull latest changes
echo "  ⬇️  Sincronizando datos del equipo..."
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git pull --rebase --quiet 2>/dev/null || echo "  ⚠️  No se pudo hacer pull (sin conexion o sin remote). Continuando..."
else
    echo "  ⚠️  No es un repo git aun. Los datos se guardaran localmente."
fi
echo ""

# Step 2: Start server (opens browser automatically)
echo "  🚀 Abriendo dashboard..."
echo "  💡 Cuando termines, presiona Ctrl+C para cerrar y sincronizar."
echo ""

python3 server.py

# Step 3: After Ctrl+C, commit and push
echo ""
echo "  ⬆️  Guardando y sincronizando cambios..."

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    if git diff --quiet data.json 2>/dev/null; then
        echo "  ✅ Sin cambios nuevos."
    else
        git add data.json
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
        git commit -m "Update no-show data - $TIMESTAMP" --quiet
        git push --quiet 2>/dev/null && echo "  ✅ Cambios sincronizados con el equipo!" || echo "  ⚠️  No se pudo hacer push. Haz 'git push' manualmente cuando tengas conexion."
    fi
else
    echo "  ✅ Datos guardados localmente."
fi

echo ""
echo "  👋 Hasta la proxima!"
echo ""
