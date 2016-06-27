# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box       = 'ubuntu/trusty64'
  config.vm.hostname  = 'open-nfe'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network 'private_network', type: 'dhcp'
  config.vm.synced_folder '.', '/vagrant', type: 'nfs' if Vagrant::Util::Platform.linux?
  config.vm.synced_folder '.', '/vagrant', type: 'smb' if Vagrant::Util::Platform.windows?
  config.vm.provision :shell, path: 'provisions/bootstrap.sh', keep_color: true
  config.vm.provision :shell, path: 'provisions/user_bootstrap.sh', keep_color: true, privileged: false

  config.vm.provider :virtualbox do |vb|
    vb.memory = 1000
    vb.cpus   = 2
  end
end
