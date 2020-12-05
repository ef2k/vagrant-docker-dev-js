Configuration to run docker as provider for vagrant. The environment is setup
with Ubuntu 20.04 LTS, node and pnpm.


## Pre-reqs

Install:
- docker (https://www.docker.com/products/docker-desktop)
- vagrant (https://www.vagrantup.com)

## Usage
```
vagrant up
vagrant ssh
```

or use `make`, which will run the above commands by default.

## Resetting the env

```
make clean
```
