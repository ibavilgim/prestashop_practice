#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Necesitas ser root para poder ejecutar el script"
    exit 1
fi

echo "[:] Ejecutando script..."

# Actualización del sistema
apt update
apt upgrade -y

# Configurar debconf para phpMyAdmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password 1234" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password 1234" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password 1234" | debconf-set-selections

# Instalación de phpMyAdmin
apt install -y phpmyadmin

# Configuración de Apache para phpMyAdmin
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Reinicio y habilitación de servicios
systemctl restart apache2
systemctl enable apache2

echo "[:] Script ejecutado con éxito. Servicios configurados."

