Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true


       
######### web vm #########

    config.vm.define "web01" do |web01|
        web01.vm.box = "centos/stream9"
        web01.vm.hostname = "web01"
        web01.vm.network "private_network", ip: "192.168.10.18"
        web01.vm.provider "virtualbox" do |vb|
            vb.memory = "3060"
            vb.cpus = 2
        end
    end
    
    
    config.vm.define "web02" do |db01|
        db01.vm.box = "centos/stream9"
        db01.vm.hostname = "wdb01"
        db01.vm.network "private_network", ip: "192.168.10.19"
        db01.vm.provider "virtualbox" do |vb|
            vb.memory = "3060"
            vb.cpus = 2
        end
    end
end    