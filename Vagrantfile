Vagrant.configure("2") do |config|

  # VM 1: CentOS
  config.vm.define "default" do |localuser|
    localuser.vm.box = "jasonc/centos7"
    localuser.vm.hostname = "localuser"

    localuser.vm.network "forwarded_port",
      guest: 22,
      host: 2225,
      id: "ssh",
      auto_correct: false

    localuser.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  # VM 2: Ubuntu 22
  config.vm.define "ubuntu22" do |ubuntu|
    ubuntu.vm.box = "ubuntu/jammy64"
    ubuntu.vm.hostname = "ubuntu22"

  (8888..8890).each do |port|

    ubuntu.vm.network "forwarded_port", 
      guest: port, 
      host: port, 
      auto_correct: true
  end

  ubuntu.vm.network "forwarded_port", 
      guest: 22,
      host: 2223,
      id: "ssh",
      auto_correct: false

    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

end
