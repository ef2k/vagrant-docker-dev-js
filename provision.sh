# base
echo "~> Provisioning as $USER"

# Get the slate ready
sudo apt-get install build-essential -y

# Install basic tooling, feel free to extend this to your needs.
sudo apt-get install git -y
sudo apt-get install curl -y
sudo apt-get install neovim -y

# Installing node using node-version-manager (NVM)
# See: https://github.com/nvm-sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 16.13.0
nvm use 16.13.0

# Install global node packages. Make sure to pin versions.
npm install -g yarn@1.22.17

# Start the ssh-agent and then add the ssh key to it
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

