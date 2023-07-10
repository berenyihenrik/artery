Vagrant.configure("2") do |config|
	if Vagrant.has_plugin? "vagrant-vbguest"
	  config.vbguest.no_install  = true
	  config.vbguest.auto_update = false
	  config.vbguest.no_remote   = true
	end
    config.vm.box = "debian/contrib-buster64"
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/vagrant.yml"
    end

    config.vm.provider :virtualbox do |vb|
        # distinguish VMs by a location-dependent suffix
        name_suffix = Digest::SHA1.hexdigest(Dir.pwd)[0..6]

        vb.gui = true
        vb.memory = 2048
        vb.name = "Artery Vagrant VM " + name_suffix
        vb.customize ["modifyvm", :id, "--vram", "32"]
    end
end
