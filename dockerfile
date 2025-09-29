# Dockerfile Modificado: Cambiamos a la imagen con Apache integrado
FROM php:8.2-apache

# NOTA: En la imagen php-apache, las extensiones se instalan con 'docker-php-ext-install'
# Instala extensiones PHP necesarias (ejemplos comunes)
RUN docker-php-ext-install mysqli gd curl

# Define el directorio de trabajo donde la aplicación se ejecutará (estándar de Apache)
WORKDIR /var/www/html

# Copia el código fuente completo del proyecto (app, config, index.php, etc.)
COPY. /var/www/html

# Configuración de Seguridad: Cambiar el propietario de los archivos a 'www-data' (estándar de Apache)
RUN chown -R www-data:www-data /var/www/html

# Apache ya expone el puerto 80 por defecto
EXPOSE 80

# El comando por defecto inicia Apache/PHP.
CMD ["apache2-foreground"]