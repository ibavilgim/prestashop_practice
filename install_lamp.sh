#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Necesitas ser root para poder ejecutar el script"
    exit 1
fi

echo "[:] Ejecutando script..."

# Actualización del sistema
apt update
apt upgrade -y

# Instalación de paquetes
apt install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Configuración de MySQL
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234'; FLUSH PRIVILEG>

# Reinicio y habilitación de servicios
systemctl restart apache2
systemctl enable apache2
systemctl restart mysql
systemctl enable mysql

echo "[:] Script ejecutado con éxito. Servicios configurados. Puedes acceder a phpMyAdmin en http://<tu>

