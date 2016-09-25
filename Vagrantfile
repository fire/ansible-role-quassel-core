Vagrant.configure("2") do |config|
  # Switch method to passwords instead of ssh
  config.ssh.password = "vagrant"
  config.ssh.insert_key = false
  # End
  config.vm.box = "geerlingguy/centos7"
    # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "test.yml"
      ansible.sudo = true
      ansible.install = true
      ansible.verbose = true
  end
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
  end
  config.vm.network "private_network", ip: "192.168.59.2"
end
