# base
echo "~> Provisioning as $USER"

sudo apt-get install build-essential -y

sudo apt-get install git -y
sudo apt-get install curl -y

# https://github.com/nvm-sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 14.15.1
nvm use 14.15.1

# https://pnpm.js.org/en/installation
npm install -g pnpm@5.13.5

# symlink in home folder for convenience
ln -s /code ~/code