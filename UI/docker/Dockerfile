FROM docker.io/nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf.templ
COPY conf-builder.sh /usr/bin/conf-builder.sh
COPY html /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html/
RUN chmod 777 /etc/nginx/conf.d/default.conf.templ
RUN chmod 777 /etc/nginx/conf.d/default.conf
RUN chmod -R 777 /var/cache/nginx/
RUN chmod -R 777 /etc/nginx/conf.d/
RUN chmod -R 777 /var/run/

EXPOSE 8080 443

CMD /bin/bash -x ./usr/bin/conf-builder.sh && cat /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
