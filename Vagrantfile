# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

# Load ~/.VagrantFile if exist, permit local config provider
vagrantfile = File.join("#{Dir.home}", '.VagrantFile')
load File.expand_path(vagrantfile) if File.exists?(vagrantfile)

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', type: "rsync", rsync__exclude: [ '.vagrant', '.git', 'build' ]

  templates = []

  Dir.glob('./vars/*.json') do |item|
    json = File.read("#{item}")
    templates.push(JSON.parse(json))
  end

  templates.each do |template|
    config.vm.define "#{template['box_name']}" do |node|
      node.vm.hostname = "#{template['box_name']}-#{template['roles_version']}"
      node.vm.box = "debian/stretch64"
      node.vm.box_version = "#{template['debian_version']}"

      node.vm.provision "shell", path: "scripts/ansible_install_pip", env: { "ANSIBLE_VERSION" => "#{template['ansible_version']}" }
      node.vm.provision "shell", path: "scripts/ansible_roles_galaxy", env: { "ROLES_VERSION" => "#{template['roles_version']}" }

      node.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "ansible/#{template['box_name']}.yml"
        ansible.install = false
        ansible.playbook_command = ". /tmp/venv/bin/activate && ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 ansible-playbook"
      end
    end
  end

end

