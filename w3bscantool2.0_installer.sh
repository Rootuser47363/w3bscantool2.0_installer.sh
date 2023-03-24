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

# Detectar sistema operativo
if [ -f /etc/debian_version ]; then
  # Debian, Ubuntu
  echo "Detectado Debian/Ubuntu"
  sudo apt-get update
elif [ -f /etc/redhat-release ]; then
  # Red Hat, CentOS, Fedora
  echo "Detectado Red Hat/CentOS/Fedora"
  sudo dnf update
elif [ -f /etc/arch-release ]; then
  # Arch Linux
  echo "Detectado Arch Linux"
  sudo pacman -Sy
else
  echo "Sistema operativo no soportado"
  exit 1
fi

# Descargar script desde Github
echo "Descargando script desde Github..."
curl -O https://raw.githubusercontent.com/Rootuser47363/w3bscantool2.0.sh/main/w3bscantool2.0.sh

# Dar permisos de ejecución
chmod +x w3bscantool2.0.sh

echo "La instalación de w3bscantool2.0.sh se ha completado exitosamente."
echo "Para ejecutar la herramienta, use el comando: ./w3bscantool2.0.sh"
