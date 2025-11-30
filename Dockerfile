FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

USER root

RUN apt update -y                               &&\
    apt upgrade -y                              &&\
    apt install -y                              \
        git                                     \
        build-essential                         \
        pkg-config                              \
        libssl-dev                              \
        llvm-dev                                \
        python3-dev                             \
        clang                                   \
        clang-format                            \
        cmake                                   \
        ninja-build                             \
        zsh                                     \
        curl                                    \
        wget                                    \
        sudo                                    \
        nano                                    &&\
    yes | unminimize || echo "already not slim" &&\
    rm -rf /var/lib/apt/lists/*

RUN echo 'ubuntu  ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

USER ubuntu
ENV CHSH=yes RUNZSH=no KEEP_ZSHRC=no OVERWRITE_CONFIRMATION=no
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV CHSH=""  RUNZSH="" KEEP_ZSHRC="" OVERWRITE_CONFIRMATION=""

ENTRYPOINT ["/usr/bin/zsh"]
