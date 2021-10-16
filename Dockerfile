FROM caddy:2-alpine
WORKDIR /usr/share/caddy/
COPY ./html .
EXPOSE 80
