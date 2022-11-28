FROM nginx:1.15-alpine
#RUN rm /etc/nginx/conf.d/*
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

ADD index.html /usr/share/nginx/html/

COPY docker-entrypoint.sh /

RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
#####

###