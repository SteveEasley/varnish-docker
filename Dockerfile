FROM debian:jessie
MAINTAINER Steve Easley <steve.easley@gmail.com>

RUN apt-get update && \
    apt-get -y install apt-transport-https curl && \
    curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - && \
    echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list && \
    apt-get -y install varnish && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 6082

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["varnishd", "-F", "-a", ":80", "-T", ":6082", "-f", "/etc/varnish/default.vcl", "-s", "malloc,1G"]
