# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Customize memory
  config.vm.customize ["modifyvm", :id, "--memory", "256"]

  config.vm.provision :shell, :inline => "[ -f /tmp/updated ] || apt-get update && touch /tmp/updated"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "./"
    puppet.module_path = "modules"
    puppet.manifest_file = "site.pp"
    puppet.options = "--verbose"
  end

  config.vm.define :es do |es|
    es.vm.network :hostonly, "192.168.33.10"
    es.vm.forward_port 5984, 5984
    es.vm.forward_port 9200, 9200
  end
end