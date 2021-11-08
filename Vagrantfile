NAME = "dev-js"
Vagrant.configure("2") do |config|
  config.vm.hostname = NAME
  config.vm.provider "docker" do |d|
    d.name = NAME
    d.build_dir = "."
    d.has_ssh = true
  end

  # Upload dot files for git and ssh
  config.vm.provision "file", source: "~/.gitconfig", destination: "$HOME/.gitconfig"
  config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "$HOME/.ssh/id_ed25519"
  config.vm.provision "file", source: "~/.ssh/id_ed25519.pub", destination: "$HOME/.ssh/id_ed25519.pub"

  # Run the provisioning script
  config.vm.provision "shell", path: "provision.sh", privileged: false

  # Uncomment to sync certain folders, keep in mind this is using defaults
  # and performance might take a hit without ignoring node_modules. Consider
  # using rsync or another syncing strategy that allows for filtering.
  # config.vm.synced_folder ".", "/code", docker_consistency: "cached"

  # Export a port range for port forwarding
  for i in 3000..3050
    config.vm.network :forwarded_port, guest: i, host: i
  end
end
