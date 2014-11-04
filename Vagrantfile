# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

def local_cache(basebox_name)
  cache_dir = Vagrant::Environment.new.home_path.join('cache',  basebox_name)
  FileUtils.mkpath cache_dir unless cache_dir.exist?
  cache_dir
end

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "docker" do |d|
    d.image      = "marklee77/ubuntu-trusty-vagrantbox"
    d.has_ssh    = true
    d.privileged = true
  end

  config.vm.define "standard", primary: true do |machine|

    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/getreqs.yml"
    end

    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/prep.yml"
      ansible.extra_vars = {
        #keystone_dockerized_deployment: true,
        mariadb_bind_address: "0.0.0.0",
      }
    end

    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/deploy.yml"
      ansible.extra_vars = {
        #keystone_dockerized_deployment: true,
        #openstack_mysql_host: "{{ ansible_docker0['ipv4']['address'] }}",
        #openstack_identity_endpoint_host: "{{ ansible_docker0['ipv4']['address'] }}"
      }
    end

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/test.yml"
    end

  end

  config.vm.define "docker-build-image", autostart: false do |machine|
    machine.vm.provision "ansible" do |ansible|
      ansible.extra_vars = {
        mariadb_dockerized_deployment: true
      }
      ansible.playbook = "provisioning/deploy.yml"
    end

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/test.yml"
    end
  end

  config.vm.define "docker-pull-image", autostart: false do |machine|
    machine.vm.provision "ansible" do |ansible|
      ansible.extra_vars = {
        mariadb_dockerized_deployment: true,
        mariadb_docker_username: "marklee77",
        mariadb_docker_build_image: false
      }
      ansible.playbook = "provisioning/deploy.yml"
    end

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/test.yml"
    end
  end


end

