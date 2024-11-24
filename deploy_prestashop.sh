#!/bin/bash

# Verificar si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Necesitas ser root para poder ejecutar el script"
    exit 1
fi

echo "[:] Ejecutando script..."

# Actualización del sistema
apt update
apt upgrade -y

# Instalación de paquetes
apt install -y apache2 mysql-server php libapache2-mod-php php-mysql unzip php-intl

# Variables de la base de datos
DB_NAME="prestashop"
DB_USER="prestashopuser"
DB_PASS="prestashop_password"
MYSQL_ROOT_PASS="1234"  # Contraseña de root en MySQL

# Crear la base de datos y el usuario para PrestaShop
mysql -u root -p$MYSQL_ROOT_PASS -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p$MYSQL_ROOT_PASS -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -u root -p$MYSQL_ROOT_PASS -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mysql -u root -p$MYSQL_ROOT_PASS -e "FLUSH PRIVILEGES;"

# Descargar y extraer PrestaShop
cd /var/www/html
curl -L https://github.com/PrestaShop/PrestaShop/releases/download/8.2.0/prestashop_8.2.0.zip -o prestashop_8.2.0.zip
unzip prestashop_8.2.0.zip
rm prestashop_8.2.0.zip

# Configurar los permisos para el servidor web
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Reiniciar Apache y MySQL
systemctl restart apache2
systemctl enable apache2
systemctl restart mysql
systemctl enable mysql

echo "[:] PrestaShop instalado y configurado con éxito."
