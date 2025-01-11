# A basic Dockerfile to demonstrate our repository
# Microsoft image already includes zsh and oh-my-zsh!
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Prompt avoidance
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/usr/bin/zsh

# Install the necessary packages
RUN apt-get update -y && apt-get install -y \
tmux \
# Cleanup
&& apt-get autoremove -y \
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists/*

# Install powerlevel10k and zsh-autocomplete
RUN git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-autocomplete
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/vscode/.oh-my-zsh/custom/themes/powerlevel10k