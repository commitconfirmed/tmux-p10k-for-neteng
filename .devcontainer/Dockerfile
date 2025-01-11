# A basic Dockerfile to demonstrate our repository
FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER root
WORKDIR /root

# Prompt avoidance
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

# Install the necessary packages
RUN apt-get update -y && apt-get install -y \
git \
zsh \
tmux \
wget \
vim \
# Cleanup
&& apt-get autoremove -y \
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists/*

# Default zsh shell
RUN chsh -s $(which zsh)

# Install oh-my-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install powerlevel10k and zsh-autocomplete
RUN git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k