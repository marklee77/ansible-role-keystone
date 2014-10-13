FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/docker/keystone
WORKDIR /var/cache/docker/keystone

RUN if [ ! -f playbooks/group_vars/all.yml ]; then \
      mkdir -p playbooks/group_vars;\
      ln -s ../../defaults/main.yml playbooks/group_vars/all.yml;\
    fi
RUN ansible-playbook -i inventories/local.ini playbooks/install.yml

VOLUME [ "/etc/keystone", "/var/lib/keystone", "/var/log/keystone", \
         "/var/log/supervisor" ]

#CMD [ "/usr/bin/supervisord" ]
CMD [ "sudo", "-u", "keystone", "/usr/bin/keystone-all" ]

EXPOSE 5000 35357
