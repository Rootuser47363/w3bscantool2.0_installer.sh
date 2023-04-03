#!/bin/bash

# Función para mostrar el banner
show_banner() {
  echo "--------------------------------------------------"
  echo "|      Bienvenido a la autoinstalación de         |"
  echo "|             w3bscantool2.0.sh                   |"
  echo "|   Herramienta de Escaneo de Seguridad Web        |"
  echo "|                                                 |"
  echo "|                por Root/user/47363              |"
  echo "--------------------------------------------------"
  echo ""
}

# Mostrar banner
show_banner

# Detectar sistema operativo y actualizar paquetes
if [ -f /etc/debian_version ]; then
  # Debian, Ubuntu
  echo "Detectado Debian/Ubuntu"
  echo "Actualizando paquetes..."
  sudo apt update && sudo apt upgrade -y
elif [ -f /etc/redhat-release ]; then
  # Red Hat, CentOS, Fedora
  echo "Detectado Red Hat/CentOS/Fedora"
  echo "Actualizando paquetes..."
  sudo dnf update -y && sudo dnf upgrade -y
elif [ -f /etc/arch-release ]; then
  # Arch Linux
  echo "Detectado Arch Linux"
  echo "Actualizando paquetes..."
  sudo pacman -Syu --noconfirm
else
  echo "Sistema operativo no soportado"
  exit 1
fi

# Descargar script desde Github
echo "Descargando script desde Github..."
curl -O https://raw.githubusercontent.com/Rootuser47363/w3bscantool2.0.sh/main/w3bscantool2.0.sh

# Dar permisos de ejecución
chmod +x w3bscantool2.0.sh

echo ""
echo "La instalación de w3bscantool2.0.sh se ha completado exitosamente."
echo "Para ejecutar la herramienta, use el comando: ./w3bscantool2.0.sh"
echo ""
echo "Ejemplo de uso: ./w3bscantool2.0.sh -u <url> [-h] [-l] [-r] [-s] [-q] [-x]"
echo ""
echo "Opciones:"
echo "-h Mostrar este mensaje de ayuda"
echo "-u Especificar la URL del sitio web a escanear"
echo "-l Escanear vulnerabilidades LFI"
echo "-r Escanear vulnerabilidades RFI"
echo "-s Escanear vulnerabilidades de SQL injection"
echo "-q Escanear vulnerabilidades de CMS específicas"
echo "-x Escanear vulnerabilidades de XSS"
