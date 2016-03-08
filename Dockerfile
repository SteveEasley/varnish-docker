FROM centos:6
MAINTAINER Steve Easley <steve.easley@gmail.com>

RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y varnish && \
    yum clean all

EXPOSE 80 6082

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["varnishd", "-F", "-a", ":80", "-T", ":6082", "-f", "/etc/varnish/default.vcl", "-s", "malloc,1G"]
