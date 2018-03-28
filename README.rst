stretch
=======

.. |dockerbuild| image:: https://img.shields.io/docker/build/mkovac/stretch.svg
.. |dockerpulls| image:: https://img.shields.io/docker/pulls/mkovac/stretch.svg
.. |dockerstars| image:: https://img.shields.io/docker/stars/mkovac/stretch.svg

|dockerbuild| |dockerpulls| |dockerstars|

The Debian Stretch container (`docker hub <https://hub.docker.com/r/mkovac/stretch/>`_) enriched with few handy utilities, locales, cron, dumb-init and runit.

This work is a work from scratch, but is inspired by many
approaches of the others I found clever, intuitive, and following
the best practices, providing these are keen on simplicity,
usability, security and freedom of use. See the credits file
and contribute to be added.


Quick Usage
===========

If you clone, run::

    $ make latest && docker run --rm -ti mkovac/stretch bash

Since the image is to be used as base image, I suppose more common usage
would be in the `Dockerfile` in the form:

    FROM mkovac/stretch:latest
    ...


Build-time options
==================

You can `export` environment variables found in the following list:

  * ftp_proxy
  * http_proxy
  * https_proxy

The values for these variables will not end up in the resulting image.

Run-time options
================

You can define environment variables via ``--env`` argument found in the following list:

  * ftp_proxy
  * http_proxy
  * https_proxy
  * BASE_DEBUG
      * zero to higher numbers - to get more and more verbose
  * BASE_NOEXIT
      * set to 1 not to exit on startup errors
  * ADMIN_ENABLED
      * set to 1 to enable user ``admin``
  * ADMIN_PASSWORD
      * password for user ``admin``
  * ADMIN_SSH_KEY_URI
      * ssh public key uri. will be appended to ``~admin/.ssh/authorized_keys``
  * ADMIN_SSH_KEY
      * public ssh key as string. will be appended to ``~admin/.ssh/authorized_keys``
  * ROOT_PASSWORD
      * password for user root (if empty, difficult random password is generated)
  * ROOT_SSH_KEY_URI
      * ssh public key uri. will be appended to ``~root/.ssh/authorized_keys``
  * ROOT_SSH_KEY
      * public ssh key. will be appended to ``~root/.ssh/authorized_keys``
