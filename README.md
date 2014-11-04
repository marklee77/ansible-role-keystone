marklee77.keystone
=================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-keystone.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-mariadb)

The purpose of this role is to deploy keystone onto Ubuntu. There is also an
support for an experimental "dockerized" deployment. This dockerized deployment
copies the role to the target machine and uses the original ansible-based
functionality to build a docker image, and then uses recent ansible features to
manage the running service. The dockerized deployment can theoretically deploy
to any Linux platform with a running docker install and the docker-py python
client library installed.

Travis status above refers only to the non-dockerized deployment, as docker does 
not (easily) run on travis.

Role Variables
--------------

The variables below only affect the dockerized deployment:

- keystone_dockerized_deployment: false
- keystone_docker_username: default
- keystone_docker_imagename: keystone
- keystone_docker_containername: keystone

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - marklee77.keystone

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

Known Issues
------------

- the dockerized deployment still requires sudo access, even though a member of 
  the docker group should be able to build and deploy containers without sudo.

Todo
----

- problem running with supervisor...
- delegate_to for mysql 
- keystone token flush cron job
- rsync filter to get rid of swap files...
