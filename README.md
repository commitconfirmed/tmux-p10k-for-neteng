# tmux-p10k-for-neteng
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/commitconfirmed/tmux-p10k-for-neteng?quickstart=1&devcontainer_path=.devcontainer%2Fdevcontainer.json)

🚀 Levelled up shell for Network Engineers 🚀

- [Introduction](#introduction)
- [Try it out](#try-it-out)
- [Installation](#installation)
- [Setup](#setup)
- [Add TMUX](#add-tmux)
- [Usage](#usage)
- [Acklowledgements](#acknowledgements)

## Introduction

This repo expands on the [tmux-for-neteng](https://github.com/commitconfirmed/tmux-for-neteng) by moving from bash to zsh, adding the popular [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) plugin and, adding the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme for a speedier and modern looking shell.

> While I haven't used it myself due to being a Windows user, this should pair very nicely with the new [ghostty](https://github.com/ghostty-org/ghostty) terminal emulator!

## Try it out

Just click the "Open in GitHub Codespaces" button up the top!

## Installation

Follow the below step by step guide to set this up on your own machine:

- Install zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) 
- Install Oh-my-zsh (https://ohmyz.sh/#install) and follow the prompts
- Install the powerlevel10k theme and the zsh-autocomplete plugin

```sh
apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Setup

- In your `~/.zshrc` file, change the ZSH_THEME and set your plugins of choice

> Builtin plugins available at https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins if you want to further personally customise 

```sh
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    python
    golang
    zsh-autocomplete
    colored-man-pages
)
```

- There are some additional steps depending on your disrto in the [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) plugin to follow
- Restart zsh with `source ~/.zshrc`, this should now display the powerlevel10k configuration wizard which you can run through with your own personal preferences

> If you do not like your powerlevel10k look, you can always run the configuration wizard again with `p10k configure`. 
> My TMUX theme is aligned with the classic prompt style

- If you do not want to use TMUX then you are now good to go! Two more things I add for my own personal comfort are below

```sh
# Add to your .zshrc towards the bottom (but not on the last line)
# Make your prompt start at the bottom of the screen on startup
print ${(pl:$LINES::\n:):-}
# Cap the maximum number of lines for autocomplete to 6
zstyle ':autocomplete:*:*' list-lines 6
```

## Add TMUX

Pretty much every modern linux distribution these days has tmux installed by default. If not simply install tmux using your distributions package manager.

To use my tmux configuration, simply copy and paste the contents of the [.tmux.conf](.tmux.conf) file into your home directories `~/.tmux.conf`

## Usage

TMUX should automatically start when you SSH into your host if you have copied the [aliases.zsh](aliases.zsh) file into your setup. 

If not you can simply execute `tmux -u attach -t COMMITCONFIRMED || tmux -u new -s COMMITCONFIRMED` replacing "COMMITCONFIRMED" with whatever name you want at the bottom. 

Keybindings I've used as a personal preference, you can change this if you want in your own .tmux.conf file to suit your own preferences. Mousewheel scrolling and clicking of the tabs also should work.

| Keybind | Description |
| ------------------------- | --- |
| `Ctrl+Space + c` | Create new window |
| `Ctrl+Space + Ctrl+Space` | Switch between current and last window (can hold down Ctrl) |
| `Ctrl+Space + 1-9` | Switch to window # |
| `Ctrl+Space + [` | Switch to scrollback mode, can use VIM bindings here to search, etc. Press Enter twice to exit |
| `Ctrl+Space + -` | Create a Horizontal Split |
| `Ctrl+Space + =` | Create a Vertial Split |
| `Alt+Arrow Keys` | Navigate between Split Panes |
| `Ctrl+Space + d` | Detach TMUX |
| `Ctrl+Space + r` | Reload TMUX config |

## Acknowledgements

If you found this repo useful, please show your support by sponsoring or at least giving a star to the below repositories who are the ones that made this possible:

- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/marlonrichert/zsh-autocomplete
- https://github.com/romkatv/powerlevel10k