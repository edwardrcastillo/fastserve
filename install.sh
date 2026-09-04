#!/usr/bin/env bash
# ⚡ FastServe 1-Line Installer for macOS & Linux
set -e

echo "=================================================================="
echo "⚡ Instalador de FastServe (Universal High-Speed LAN File Server)"
echo "=================================================================="

INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"
TARGET="$INSTALL_DIR/fastserve"

echo "⬇️  Descargando ejecutable desde GitHub..."
curl -sSL "https://raw.githubusercontent.com/edwardrcastillo/fastserve/main/fastserve" -o "$TARGET"
chmod +x "$TARGET"

# Asegurar ~/.local/bin en el PATH
SHELL_CONFIG=""
if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "*/zsh" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "*/bash" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

if [ -n "$SHELL_CONFIG" ] && [ -f "$SHELL_CONFIG" ]; then
    if ! grep -q '\.local/bin' "$SHELL_CONFIG"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
    fi
fi

# Intentar enlace simbólico en /usr/local/bin o /opt/homebrew/bin si tiene permisos
if [ -w "/opt/homebrew/bin" ]; then
    ln -sf "$TARGET" "/opt/homebrew/bin/fastserve" 2>/dev/null || true
elif [ -w "/usr/local/bin" ]; then
    ln -sf "$TARGET" "/usr/local/bin/fastserve" 2>/dev/null || true
fi

echo "=================================================================="
echo "✅ FastServe instalado con éxito en: $TARGET"
echo "=================================================================="
echo "💡 Puedes usarlo directamente desde cualquier terminal:"
echo "   fastserve /ruta/hacia/archivo.iso"
echo "   fastserve /ruta/hacia/carpeta/"
echo "   fastserve -p 8080"
echo "=================================================================="
