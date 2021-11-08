This configuration runs docker as provider for vagrant. The environment is setup
with Ubuntu 20.04 LTS, git, and node (via nvm). See provision.sh.

`gitconfig` and `ssh` keys are synced from the host to the guest.

## Pre-reqs

Install:
- docker (https://www.docker.com/products/docker-desktop)
  macos: Download and install

- vagrant (https://www.vagrantup.com)
  macos: `brew install vagrant`

## Usage
```
vagrant up
vagrant ssh
```

or use `make`, which will run the above commands by default.

## Recreating the env

This task will stop the container, delete the container and the image - giving
a clean starting point.

```
make clean
```
