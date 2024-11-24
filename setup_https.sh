#!/bin/bash

# Verificar si el script se está ejecutando como root o con sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Necesitas ser root para poder ejecutar este script"
    exit 1
fi

# Si es root, ejecutar los comandos
echo "[:] Ejecutando el script para instalar Certbot..."

# Actualizar el sistema
sudo apt update

# Actualizar todos los paquetes
sudo apt upgrade -y

# Instalar Certbot y los módulos necesarios
sudo apt install certbot python3-certbot-apache -y

# Ejecutar Certbot para configurar Apache con SSL
sudo certbot --apache

# Confirmar la instalación
echo "[:] Certbot ha sido instalado y configurado correctamente."
