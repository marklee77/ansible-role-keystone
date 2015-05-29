keystone ansible role
=====================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-keystone.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-keystone)

The purpose of this role is to deploy keystone onto Ubuntu. 

Role Variables
--------------

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
