# syntax=docker/dockerfile:1.4
FROM node:24-bookworm-slim

# Disable interactive mode
ARG DEBIAN_FRONTEND=noninteractive

# Set timezone to JST
ENV TZ=Asia/Tokyo

# Add .local to PATH
ENV PATH="${PATH}:/root/.local/bin"

WORKDIR /workdir

# Set shell from sh to bash
SHELL ["/bin/bash", "-c"]

# Copy all files and directories in the same level as Dockerfile to /workdir
COPY . /workdir

# Install packages
RUN apt update && apt upgrade -y && \
    apt install -y \
    time \
    tzdata \
    tree \
    git \
    curl \
    build-essential \
    python3.11 \
    pipx \
    && apt autoremove -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    # Copy config/acc
    && mkdir -p /root/.config/atcoder-cli-nodejs/ \
    && cp -rf /workdir/config/acc/* /root/.config/atcoder-cli-nodejs/ \
    # Copy config/oj
    && mkdir -p /root/.local/share/online-judge-tools/ \
    && cp -rf /workdir/config/oj/* /root/.local/share/online-judge-tools/ \
    # Install atcoder-cli
    && npm install -g atcoder-cli \
    # Install online-judge-tools
    && pipx install online-judge-tools \
    # Set AtCoder Session (instead of `acc/oj login`)
    && ./sh/update_config.sh \
    # Install C++
    # # Install Rust
    # && curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y \
    # && . "$HOME/.cargo/env"
    # Set git safe directory
    && git config --global --add safe.direrectory /workdir