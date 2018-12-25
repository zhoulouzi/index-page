FROM zhoulouzi/hugo:latest as builder
ADD . /tmp/index-page/
RUN cd /tmp/index-page \
    && hugo

FROM nginx:1.15
COPY --from=builder /tmp/index-page/docs /usr/share/nginx/html/index
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]