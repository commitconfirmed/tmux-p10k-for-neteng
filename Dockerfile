# Example dockerfile that shows the installation and setup
# process from a fresh ubuntu image
FROM ubuntu:latest

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

# Update the .zshrc file
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
RUN sed -i 's/plugins=(git)/plugins=(python golang zsh-autocomplete colored-man-pages)/g' ~/.zshrc

# Copy my p10k configuration to skip the configuration wizard
COPY .p10k.zsh /root/.p10k.zsh

# Make a few more changes to the .zshrc file
RUN sed -i '1i\fi' ~/.zshrc
RUN sed -i '1i\  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"' ~/.zshrc
RUN sed -i '1i\if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then' ~/.zshrc
RUN echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc

# Set up tmux
COPY .tmux.conf /root/.tmux.conf

ENTRYPOINT [ "/bin/zsh" ]
CMD [ "-l" ]
