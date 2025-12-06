FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

USER root

RUN apt update -y                               &&\
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
        nano                                    \
        man-db                                  &&\
    yes | unminimize || echo "already not slim" &&\
    apt purge -y unminimize                     &&\
    mkdir -p -m 755 /etc/apt/keyrings && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && mkdir -p -m 755 /etc/apt/sources.list.d && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && apt install -y gh &&\
    apt autoremove -y                           &&\
    rm -rf /var/lib/apt/lists/*

RUN echo 'ubuntu  ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

USER ubuntu
ENV CHSH=yes RUNZSH=no KEEP_ZSHRC=no OVERWRITE_CONFIRMATION=no
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV CHSH=""  RUNZSH="" KEEP_ZSHRC="" OVERWRITE_CONFIRMATION=""

ENTRYPOINT ["/usr/bin/zsh"]
