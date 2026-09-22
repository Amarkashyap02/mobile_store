FROM php:8.2-fpm-alpine AS php_app
RUN docker-php-ext-install pdo pdo_mysq
WORKDIR /var/www/html
COPY . .

FROM nginx:alpine

COPY --from=php_app /var/www/html /user/

RUN echo 'server'  { /
    listen 80;  \
    index index.php index.html; \
    root /user/share/nginx/html; \
    location /  { \
        try_files $uri $uri/  /index.php
    }  \
    location ~  \.php$  {  \
        try_files $uri =404;  \
        fastcgi_pass 127.0.0.1:9000;  \
        fastcgi_index index.php; \
        include fastcgi_params;  \
        fastcgi_param SCRIPT_FILENAME $
   }  \
} ' >  /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD [ " nginx" , "-g", "daemon  off;"] 
