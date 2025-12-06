# Ubuntu FAT
A general container image to **keep host clean** and **container environment setup instant**

- Base image: `ubuntu:24.04` (docker.io)
- Release image: [`sunwoo2539/ubuntu:24.04-fat`](https://hub.docker.com/repository/docker/sunwoo2539/ubuntu/tags/24.04-fat) (docker.io)

## Use

```bash
docker image pull sunwoo2539/ubuntu:24.04-fat
```

## About
- Default user for `docker start -ai <container-name>` as `ubuntu`
- Default user shell as `zsh` with `oh-my-zsh`
- `NOPASSWD:ALL` for user `ubuntu` by default

## Preinstalled Packages
- git
- man-db
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
