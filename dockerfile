# Usar una imagen base oficial de PHP con Apache
FROM php:8.2-apache

# Instalar las extensiones de PHP necesarias (pdo_mysql)
RUN docker-php-ext-install pdo_mysql

# Copiar los archivos de la aplicación al directorio web del servidor Apache
COPY . /var/www/html/

# Exponer el puerto 80 para que el servidor web sea accesible
EXPOSE 80