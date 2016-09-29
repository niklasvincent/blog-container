FROM alpine:3.4
MAINTAINER Niklas Lindblad <niklas@lindblad.info>

LABEL caddy_version="0.9.3" architecture="amd64"

RUN apk add --no-cache libcap tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=minify" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && addgroup -S caddy \
 && adduser -D -h /home/caddy -S -s /sbin/nologin -G caddy caddy \
 && setcap cap_net_bind_service=+ep /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 2015
WORKDIR /srv

COPY caddy/output/Caddyfile.conf /etc/Caddyfile

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# grant necessary permission
RUN chown -R caddy:caddy /srv

USER caddy

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
