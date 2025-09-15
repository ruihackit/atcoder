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
        # Install atcoder-cli
        && npm install -g atcoder-cli \
        && acc config default-task-choice all \
        # Install online-judge-tools
        && pipx install online-judge-tools \
        # Copy config/acc
        && mkdir -p /root/.config/atcoder-cli-nodejs/ \
        && cp -rf /workdir/config/acc/* /root/.config/atcoder-cli-nodejs/ \
        && acc config default-test-dirname-format test \
        && acc config default-template rust \
        # Copy config/oj
        && mkdir -p /root/.local/share/online-judge-tools/ \
        && cp -rf /workdir/config/oj/* /root/.local/share/online-judge-tools/ \
        # Set AtCoder Session (instead of `acc/oj login`)
        && ./sh/update_revel_session.sh