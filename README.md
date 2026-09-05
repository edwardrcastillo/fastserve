# ⚡ FastServe

> **Servidor HTTP Universal de Descarga y Subida Directa LAN a Velocidad Gigabit (Zero-Dependencies)**  
> *Comparte y transfiere imágenes ISO, archivos ZIP masivos, instaladores, ROMs y carpetas completas entre macOS, Linux y Windows con 1 solo comando.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python: 3.8+](https://img.shields.io/badge/Python-3.8+-brightgreen.svg)](https://python.org)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-0%20(Pure%20Stdlib)-orange.svg)](https://python.org)
[![RFC 7233](https://img.shields.io/badge/Streaming-RFC%207233%20Byte--Range-purple.svg)](https://tools.ietf.org/html/rfc7233)

---

## 🌟 ¿Qué es FastServe?

**FastServe** es una herramienta de terminal ligera y ultra-rápida construida en **Python 100% estándar puro** (sin `pip`, sin dependencias externas) para transferir archivos bidireccionalmente (descarga y subida) a la velocidad máxima del cable de red local (Gigabit ~115 MB/s) con cero consumo de memoria RAM.

### 🔄 Flujo Bidireccional Mac/Linux ↔ Windows/Móvil
Si estás en una máquina secundaria (como Windows, Android o iOS) y no puedes o no quieres instalar software de terminal, simplemente abres la IP de FastServe en el navegador para:
* ⬇️ **Descargar** cualquier archivo de la máquina anfitriona.
* 📤 **Subir** archivos arrastrándolos y soltándolos (**Drag & Drop**) o usando el botón *"Subir Archivo"* (File Picker).

---

## ✨ Características Principales

* 🚀 **Cero Dependencias:** Funciona al instante en cualquier Mac, Linux (Pop!_OS, Ubuntu, Debian, Arch) o Windows con Python 3 instalado.
* 📤 **Subidas en Streaming (Drag & Drop + File Explorer):** Arrastra archivos de cualquier tamaño desde Windows Explorer al navegador y súbelos directamente a la carpeta anfitriona en streaming (0 RAM overhead).
* 📊 **Telemetría de Subida en Tiempo Real:** Barra de progreso, velocidad en vivo (`⚡ MB/s`), porcentaje y cola multi-archivo.
* 📦 **Soporte RFC 7233 (Byte-Range):** Descargas reanudables y multi-hilo (`curl -C -`, `wget`, `aria2c`, navegadores y gestores de descarga).
* 💿 **Manejo de Archivos Gigantes (ISOs, ZIPs, Backups):** Transmisión directa de disco a socket en bloques de 128 KB.
* 📁 **Navegación Interactiva por Directorios:** Explorador web con árbol de carpetas (*breadcrumbs*), tamaños reales e iconos por extensión.
* 🎯 **Modo Archivo Único:** Sirve un archivo específico con página de descarga directa y comandos de consola pregenerados.
* 🔍 **Buscador en Tiempo Real:** Filtra archivos instantáneamente en el navegador.
* 📋 **1-Click Copy:** Botones para copiar el enlace directo o comandos optimizados para terminal.
* 📱 **Banner para Móvil:** Genera el enlace de red local (`LAN IP`) listo para abrir en cualquier dispositivo.

---

## ⚡ Instalación Rápida (1 Línea)

En cualquier terminal **macOS o Linux**:

```bash
curl -fsSL https://raw.githubusercontent.com/edwardrcastillo/fastserve/main/install.sh | bash
```

---

## 🚀 Uso y Ejemplos

### 1. Servir una Carpeta (Descargas y Subidas Habilitadas)
```bash
fastserve /ruta/hacia/mis_archivos/
```
*(O simplemente `fastserve` dentro de la carpeta actual)*

### 2. Servir una Imagen ISO o Archivo Pesado Individual
```bash
fastserve /ruta/hacia/ubuntu-24.04-desktop-amd64.iso
```

### 3. Modo Solo Lectura (Deshabilitar Subidas)
```bash
fastserve /ruta/hacia/carpeta/ --no-upload
```

### 4. Especificar un Puerto Personalizado
```bash
fastserve /Volumes/Almacenamiento/ -p 8090
```

---

## 🛠️ Arquitectura

```
                    ┌─────────────────────────┐
                    │       FastServe         │
                    │   (Pure Python Stdlib)  │
                    └────────────┬────────────┘
                                 │
     ┌───────────────────────────┼───────────────────────────┐
     ▼                           ▼                           ▼
[ RFC 7233 Downloads ]   [ Glassmorphic Web UI ]   [ Chunked Stream Uploads ]
- 128 KB Chunk Streaming - Real-time Live Search   - Drag & Drop from Windows
- Multi-threaded (aria2) - Folder Navigation Tree  - Live Speed (MB/s) & ETA
- Zero RAM allocation    - 1-Click cURL / aria2c   - Multi-file Upload Queue
```

---

## 📜 Licencia

Distribuido bajo la Licencia **MIT**. Consulta [`LICENSE`](LICENSE) para más detalles.
