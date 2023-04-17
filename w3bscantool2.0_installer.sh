#!/bin/bash

# Función para mostrar el banner
show_banner() {
  cat << "EOF"
--------------------------------------------------
|      Bienvenido a la autoinstalación de         |
|             w3bscantool2.0.sh                   |
|   Herramienta de Escaneo de Seguridad Web        |
|                                                 |
|                por Root/user/47363              |
--------------------------------------------------

EOF
}

# Mostrar banner
show_banner

# Detectar sistema operativo y actualizar paquetes
if [ -f /etc/debian_version ]; then
  # Debian, Ubuntu
  echo "Detectado Debian/Ubuntu"
  echo "Actualizando paquetes..."
  sudo apt-get update && sudo apt-get upgrade -y
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
elif [ -f /etc/os-release ] && grep -qi "kali" /etc/os-release; then
  # Kali Linux
  echo "Detectado Kali Linux"
  echo "Actualizando paquetes..."
  sudo apt-get update && sudo apt-get upgrade -y
elif [ -f /etc/os-release ] && grep -qi "parrot" /etc/os-release; then
  # Parrot OS
  echo "Detectado Parrot OS"
  echo "Actualizando paquetes..."
  sudo apt-get update && sudo apt-get upgrade -y
elif [ -f /etc/os-release ] && grep -qi "suse" /etc/os-release; then
  # SUSE Linux
  echo "Detectado SUSE Linux"
  echo "Actualizando paquetes..."
  sudo zypper update -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  echo "Detectado macOS"
  echo "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Actualizando paquetes..."
  brew update && brew upgrade
else
  echo "Sistema operativo no soportado"
  exit 1
fi

# Descargar script desde Github
echo "Descargando script desde Github..."
curl -O https://raw.githubusercontent.com/Rootuser47363/w3bscantool2.0.sh/main/w3bscantool2.0.sh

# Dar permisos de ejecución
chmod +x w3bscantool2.0.sh

# Ejecutar herramienta
echo "Ejecutando herramienta..."
./w3bscantool2.0.sh
