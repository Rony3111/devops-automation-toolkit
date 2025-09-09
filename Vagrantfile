Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

### DB vm  ####
  config.vm.define "db01" do |db01|
    db01.vm.box = "centos/stream9"
    db01.vm.hostname = "db01"
    db01.vm.network "private_network", ip: "192.168.56.18"
    db01.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = 2
   end


   ### WEB VM ###
  config.vm.define "web01" do |web01|
    web01.vm.box = "centos/stream9"
    web01.vm.hostname = "web01"
    web01.vm.network "private_network", ip: "192.168.56.19"
    web01.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "2048"
     VB.cpus = 2
   end
end

end

