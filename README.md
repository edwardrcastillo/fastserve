# ⚡ FastServe

> **Servidor HTTP Universal de Distribución de Archivos a Velocidad Gigabit (Zero-Dependencies)**  
> *Comparte y descarga imágenes ISO, archivos ZIP masivos, instaladores, ROMs y datasets en tu red local (LAN/WAN) con 1 solo comando.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python: 3.8+](https://img.shields.io/badge/Python-3.8+-brightgreen.svg)](https://python.org)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-0%20(Pure%20Stdlib)-orange.svg)](https://python.org)
[![RFC 7233](https://img.shields.io/badge/Streaming-RFC%207233%20Byte--Range-purple.svg)](https://tools.ietf.org/html/rfc7233)

---

## 🌟 ¿Qué es FastServe?

**FastServe** es una herramienta de terminal ligera y ultra-rápida construida en **Python 100% estándar puro** (sin `pip`, sin dependencias externas) para transferir archivos de cualquier tamaño (**8 GB, 50 GB, 100 GB+**) a la velocidad máxima de tu cable de red local (Gigabit ~115 MB/s) con cero consumo de memoria RAM.

Incluye una **interfaz web moderna y responsiva (Glassmorphic Dark Mode)** que permite explorar carpetas, buscar archivos en tiempo real y copiar comandos de terminal con 1 clic (`curl -C -`, `aria2c -x 16`).

---

## ✨ Características Principales

* 🚀 **Cero Dependencias:** Funciona al instante en cualquier Mac, Linux (Pop!_OS, Ubuntu, Debian, Arch) o Windows con Python 3 instalado.
* 📦 **Soporte RFC 7233 (Byte-Range):** Descargas reanudables y multi-hilo (`curl -C -`, `wget`, `aria2c`, navegadores y gestores de descarga).
* 💿 **Manejo de Archivos Gigantes (ISOs, ZIPs, Backups):** Transmisión directa de disco a socket en bloques de 128 KB sin cargar el archivo en RAM.
* 📁 **Navegación Interactiva por Directorios:** Explorador web con árbol de carpetas (*breadcrumbs*), tamaños reales e iconos por extensión (`.iso`, `.zip`, `.mp4`, `.pdf`, `.py`, etc.).
* 🎯 **Modo Archivo Único:** Sirve un archivo específico con página de descarga directa y comandos de consola pregenerados.
* 🔍 **Buscador en Tiempo Real:** Filtra archivos instantáneamente en el navegador.
* 📋 **1-Click Copy:** Botones para copiar el enlace de descarga directo o comandos optimizados para terminal.
* 📱 **Banner para Móvil:** Genera el enlace de red local (`LAN IP`) listo para abrir en iOS y Android.

---

## ⚡ Instalación Rápida (1 Línea)

En cualquier terminal **macOS o Linux**:

```bash
curl -fsSL https://raw.githubusercontent.com/edwardrcastillo/fastserve/main/install.sh | bash
```

---

## 🚀 Uso y Ejemplos

### 1. Servir una Imagen ISO o Archivo Pesado
```bash
fastserve /ruta/hacia/ubuntu-24.04-desktop-amd64.iso
```
*Abre una página con el botón de descarga y los comandos `curl`/`aria2c` listos para copiar y pegar en otra máquina o descargar en el móvil.*

### 2. Compartir una Carpeta Completa con Explorador Web
```bash
fastserve /ruta/hacia/mis_archivos/
```
*(O simplemente `fastserve` dentro de la carpeta actual)*

### 3. Especificar un Puerto Personalizado
```bash
fastserve /Volumes/Almacenamiento/ -p 8090
```

---

## 🛠️ Arquitectura y Rendimiento

```
                    ┌─────────────────────────┐
                    │       FastServe         │
                    │   (Pure Python Stdlib)  │
                    └────────────┬────────────┘
                                 │
                 ┌───────────────┴───────────────┐
                 ▼                               ▼
       [ RFC 7233 Byte-Range ]         [ Glassmorphic Web UI ]
       - 128 KB Chunk Streaming        - Real-time Live Search
       - Multi-threaded (aria2c)       - Folder Navigation Tree
       - Zero RAM allocation           - 1-Click cURL / aria2c
```

---

## 📜 Licencia

Distribuido bajo la Licencia **MIT**. Consulta [`LICENSE`](LICENSE) para más detalles.
