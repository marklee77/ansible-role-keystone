keystone ansible role
=====================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-keystone.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-keystone)
[![Circle CI](https://circleci.com/gh/marklee77/ansible-role-keystone/tree/master.svg?style=shield&circle-token=0c664f98ae3751e2c2dc6bd737f2834b03231668)](https://circleci.com/gh/marklee77/ansible-role-keystone/)

The purpose of this role is to deploy keystone onto Ubuntu. 

Role Variables
--------------

- openstack_mysql_host: 127.0.0.1
- openstack_mysql_port: 3306
- openstack_log_verbose: true
- openstack_log_debug: false
- openstack_identity_region: RegionOne
- openstack_identity_token_expiration: 3600

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - keystone

License
-------

GPLv2

Author Information
------------------

http://stillwell.me
