NAME = "dev-js"
Vagrant.configure("2") do |config|
  config.vm.hostname = NAME
  config.vm.provider "docker" do |d|
    d.name = NAME
    d.build_dir = "."
    d.has_ssh = true
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false
  config.vm.synced_folder ".", "/code", docker_consistency: "cached"
end
