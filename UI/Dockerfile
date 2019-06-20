FROM node:8.15.0-alpine as BUILD
COPY . .
RUN apk update && \
    apk add git && \
    npm install && \
    npm install -g gulp && \
    gulp build

FROM docker.io/nginx:latest

COPY docker/default.conf /etc/nginx/conf.d/default.conf.templ
COPY docker/conf-builder.sh /usr/bin/conf-builder.sh
COPY --from=BUILD dist /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html/
RUN chmod 777 /etc/nginx/conf.d/default.conf.templ
RUN chmod 777 /etc/nginx/conf.d/default.conf
RUN chmod -R 777 /var/cache/nginx/
RUN chmod -R 777 /etc/nginx/conf.d/
RUN chmod -R 777 /var/run/

EXPOSE 8080 443

CMD /bin/bash -x ./usr/bin/conf-builder.sh && cat /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
