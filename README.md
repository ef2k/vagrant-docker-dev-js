Configuration to run docker as provider for vagrant. The environment is setup
with Ubuntu 20.04 LTS, node and pnpm. See provision.sh.

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
