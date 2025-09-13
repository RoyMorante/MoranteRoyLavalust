# Use PHP 8.1 with Apache
FROM php:8.1-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Ensure .htaccess overrides are allowed
RUN echo "<Directory /var/www/html/>" > /etc/apache2/conf-available/lavalust.conf \
    && echo "    AllowOverride All" >> /etc/apache2/conf-available/lavalust.conf \
    && echo "</Directory>" >> /etc/apache2/conf-available/lavalust.conf \
    && a2enconf lavalust

# Set working dir
WORKDIR /var/www/html

# Copy app files
COPY . /var/www/html/

EXPOSE 80

CMD ["apache2-foreground"]
