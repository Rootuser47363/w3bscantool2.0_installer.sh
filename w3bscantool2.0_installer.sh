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
  sudo apt-get install -y curl
elif [ -f /etc/redhat-release ]; then
  # Red Hat, CentOS
  echo "Detectado Red Hat/CentOS"
  sudo yum update
  sudo yum install -y curl
else
  echo "Sistema operativo no soportado"
  exit 1
fi

