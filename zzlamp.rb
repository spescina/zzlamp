class ZzLamp
  def ZzLamp.configure(config, settings)
    # Configure The Box
    config.vm.box = "spescina/zzlamp"
    config.vm.hostname = "zzlamp"

    # Configure A Private Network IP
    config.vm.network :private_network, ip: settings["ip"] ||= "10.10.10.200"

    # Configure A Few VirtualBox Settings
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", settings["name"] ||= "zzlamp"]
      vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "2048"]
      vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] ||= "1"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.ssh.private_key_path = "ssh/id_rsa"

    # Register All Of The Configured Shared Folders
    settings["folders"].each do |folder|
      config.vm.synced_folder folder["map"], folder["to"], mount_options: ["dmode=777", "fmode=666"]
    end
  end
end