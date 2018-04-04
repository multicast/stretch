# stretch

![Build](https://img.shields.io/docker/build/mkovac/stretch.svg)
![Pulls](https://img.shields.io/docker/pulls/mkovac/stretch.svg)
![Stars](https://img.shields.io/docker/stars/mkovac/stretch.svg)

The Debian Stretch container ([Docker hub](https://hub.docker.com/r/mkovac/stretch/)) enriched with few handy utilities, locales, cron, dumb-init and runit.

This work is a work from scratch, but is inspired by many approaches of the others I found clever, intuitive, and following the best practices, providing these are keen on simplicity, usability, security and freedom of use. See the credits file and contribute to be added.

## Quick Usage

Clone & build, run `bash` to explore:

    $ docker build https://github.com/multicast/stretch
    $ docker run --rm -ti mkovac/stretch bash

Since the image is intended to be used as base image, I suppose more common usage would be in your own `Dockerfile` in the form:

    FROM mkovac/stretch:latest
    ...

## Build-time options

You can `export` environment variables found in the following list:

  * `ftp_proxy`
  * `http_proxy`
  * `https_proxy`

The values for these variables will not end up in the resulting image.

## Run-time options

You can define environment variables via `--env` argument found in the following list:

  * `ftp_proxy`
  * `http_proxy`
  * `https_proxy`
  * `BASE_DEBUG`
      * zero to higher numbers - to get more and more verbose
  * `BASE_NOEXIT`
      * set to 1 not to exit on startup errors

