# Nginx 
FROM nginx:alpine
# Ngin:
COPY .  /usr/share/nginx/html/
# 80
EXPOSE 80
