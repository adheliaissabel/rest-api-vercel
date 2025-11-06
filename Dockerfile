# Gunakan image resmi PHP + Apache
FROM php:8.2-apache

# Install ekstensi PDO dan MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Copy semua file proyek ke dalam container
COPY . /var/www/html/

# Ubah permission agar bisa dibaca oleh Apache
RUN chown -R www-data:www-data /var/www/html

# Aktifkan mod_rewrite untuk REST API (jika pakai .htaccess)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Port default Apache
EXPOSE 80
