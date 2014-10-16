FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/docker/keystone
WORKDIR /var/cache/docker/keystone

RUN if [ ! -f playbooks/group_vars/all.yml ]; then \
      mkdir -p playbooks/group_vars;\
      ln -s ../../defaults/main.yml playbooks/group_vars/all.yml;\
    fi && \
    ansible-playbook -i inventories/local.ini playbooks/install.yml && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/etc/keystone", "/var/lib/keystone", "/var/log/keystone", \
         "/var/log/supervisor" ]

CMD [ "/usr/bin/supervisord" ]

EXPOSE 5000 35357
