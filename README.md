# Supported tags and respective `Dockerfile` links

-	[`4.0` (*4.0/Dockerfile*)](https://github.com/SteveEasley/varnish-docker/blob/4.0/Dockerfile)
-	[`4.1`, `latest` (*4.1/Dockerfile*)](https://github.com/SteveEasley/varnish-docker/blob/4.1/Dockerfile)

# What is Varnish?

Varnish Cache is a web application accelerator also known as a caching HTTP reverse proxy. You install it in front of any server that speaks HTTP and configure it to cache the contents. Varnish Cache is really, really fast. It typically speeds up delivery with a factor of 300 - 1000x, depending on your architecture.

![logo](http://book.varnish-software.com/4.0/_static/weblogo.png)

# How to use this image

## Start a server instance

Starting a Varnish instance is simple:

```shell
$ docker run --name some-varnish -d steveeasley/varnish:tag
```

where `some-varnish` is the name you want to assign to your container and `tag` is the tag specifying the Version version you want. See the list above for relevant tags.

## Using your own VCL configuration file

The easiest way to use your own configuration file is to create your own Docker image based on this image. For example, add this to your own Dockerfile:

```shell
FROM steveeasley/varnish:4.0

COPY default.vcl /etc/varnish
```

## Example troubleshooting commands

Watch request log:

```shell
$ docker exec -it some-varnish varnishlog
```

Show backend health:

```shell
$ docker exec -it some-varnish varnishadm backend.list
```