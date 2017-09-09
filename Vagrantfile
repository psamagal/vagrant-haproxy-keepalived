Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provision :shell, path: "./scripts/install.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "256"]
  end

  config.vm.define "hp01" do |subconfig|
    subconfig.vm.network "public_network", bridge: "enp4s0", ip: "192.168.1.201"
    # subconfig.vm.network :forwarded_port, guest: 80, host: 1936
    # subconfig.vm.network :forwarded_port, guest: 9000, host: 8000
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/haproxy.yml"
      ansible.extra_vars = {
          state: 'MASTER',
          interface: 'eth1',
          virtual_router_id: 52,
          priority: 200,
          unicast_src_ip: '192.168.1.201',
          unicast_peer: '192.168.1.202',
          virtual_ip_address: '192.168.1.170'
      }
    end
  end

  config.vm.define "hp02" do |subconfig|
    subconfig.vm.network "public_network", bridge: "enp4s0", ip: "192.168.1.202"
    # subconfig.vm.network :forwarded_port, guest: 80, host: 1935
    # subconfig.vm.network :forwarded_port, guest: 9000, host: 9000
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/haproxy.yml"
      ansible.extra_vars = {
          state: 'BACKUP',
          interface: 'eth1',
          virtual_router_id: 52,
          priority: 201,
          unicast_src_ip: '192.168.1.202',
          unicast_peer: '192.168.1.201',
          virtual_ip_address: '192.168.1.170'
      }
    end
  end


  config.vm.define :nginx01 do |subconfig|
    subconfig.vm.network "public_network", bridge: "enp4s0", ip: "192.168.1.221"
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/nginx.yml"
      ansible.extra_vars = {
          ip_address: '192.168.1.221',
          member: 'Primary'
      }
    end
  end

  config.vm.define :nginx02 do |subconfig|
    subconfig.vm.network "public_network", bridge: "enp4s0", ip: "192.168.1.222"
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision/nginx.yml"
      ansible.extra_vars = {
          ip_address: '192.168.1.222',
          member: 'Secondary'
      }
    end
  end
end