FROM alpine:3.17.2
LABEL Maintainer="Tim de Pater <code@trafex.nl>" \
      Description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux."

# Install packages
RUN apk --no-cache add nginx supervisor curl python3 py3-flask py3-flask-restful py3-phonenumbers sqlite

# Configure nginx
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf

# Configure supervisord
COPY config/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/log/nginx

# Setup document root
RUN mkdir -p /usr/src/telcotoolsapi/src
RUN mkdir -p /usr/src/telcotoolsapi/scripts

# Make the document root a volume
VOLUME /usr/src/telcotoolsapi/src
VOLUME /usr/src/telcotoolsapi/scripts

#RUN /usr/src/telcotoolsapi/scripts/build.sh

# Switch to use a non-root user from here on
#USER nobody

# Add application
WORKDIR /usr/src/telcotoolsapi/src
WORKDIR /usr/src/telcotoolsapi/scripts
COPY --chown=nobody src/ /usr/src/telcotoolsapi/src/
COPY --chown=nobody scripts/ /usr/src/telcotoolsapi/scripts/

WORKDIR /usr/src/telcotoolsapi/
RUN /usr/src/telcotoolsapi/scripts/build.sh

# Expose the port nginx is reachable on
EXPOSE 5000

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:5000/ || exit 1
