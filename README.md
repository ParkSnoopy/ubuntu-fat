# Ubuntu FAT

- Base image: ubuntu:24.04 (docker.io)

## About
- Default user for `docker start -ai <container-name>` as `ubuntu`
- Default user shell as `zsh` with `oh-my-zsh`
- `NOPASSWD:ALL` for user `ubuntu` by default

## Preinstalled Packages
- git
- gh (github cli)
- build-essential
- pkg-config
- python3-dev
- llvm-dev
- clang
- clang-format
- cmake
- ninja-build
- libssl-dev
- curl
- wget
- sudo
- nano
- zsh

## Removed Packages
- unminimize
