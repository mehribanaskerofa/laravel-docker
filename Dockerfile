# PHP və Apache image istifadə edirik (PHP 8.2 versiyası)
FROM php:8.2-apache

# Composer əlavə edirik
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Laravel üçün tələb olunan PHP uzantılarını quraşdırırıq
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# Apache mod_rewrite aktivləşdiririk
RUN a2enmod rewrite

# Tətbiq fayllarını konteynerə kopyalayırıq
COPY . /var/www/html

# entrypoint.sh skriptini konteynerə kopyalayırıq
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Skriptə icazə veririk
RUN chmod +x /usr/local/bin/entrypoint.sh

# Apache serverini işə salırıq və entrypoint.sh skriptini təyin edirik
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Web server 8080 portunu açırıq
EXPOSE 8080

# Apache serverini işə salırıq
CMD ["apache2-foreground"]
