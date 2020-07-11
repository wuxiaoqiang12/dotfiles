# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
git-open
autojump
colored-man-pages
zsh-completions
zsh-autosuggestions
zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh key path
export SSH_KEY_PATH="~/.ssh/rsa_id"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sudo='sudo '
alias e='emacs -nw'
alias finder='nautilus'
#alias rm=saferm.sh


#coq setting
#export OPAMROOT=~/opam-coq.8.8.1
export OPAMROOT=~/opam-coq
eval `opam config env`

#setting for texlive
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH

#cross compile
#export PATH=$PATH:/home/jon/Downloads/gcc-linaro-4.9-2016.02-x86_64_arm-eabi/bin/
#export PATH=$PATH:/home/jon/Research/rpi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
#export ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
#export PATH=$PATH:/home/jon/Downloads/gcc-arm-8.2-2019.01-x86_64-arm-eabi/bin/
export ARM=/home/jon/Downloads/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi/bin/
export PATH=$PATH:/home/jon/Downloads/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi/bin/
export PATH=$PATH:/home/jon/Downloads/arm_tools/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu/bin/

#clightgen
#export PATH=$PATH:/home/jon/Downloads/CompCert-3.4

#cquery
export PATH=$PATH:/home/jon/Research/cquery/build/release/bin/
#tftp
export TFTP_PATH=/home/jon/Research/certikos-mirror/build/img/tftp/

#qemu
#export PATH=$PATH:/home/jon/Research/qemu-4.2.0/arm-softmmu
export PATH=$PATH:/home/jon/Research/qemu/build/arm-softmmu/
#ssr
#export http_proxy=http://127.0.0.1:12333
#export https_proxy=https://127.0.0.1:12333
#export PROXYCHAINS_CONF_FILE="/etc/proxychians.conf"
#alias pc='proxychains4'

#ROS
#source /opt/ros/melodic/setup.bash

#CertiKOS
export CERTIKOS=/home/jon/Research/certikos-mirror

#RISC-V
export RISCV=/opt/riscv

#setting for haskell platform for pandoc
#export PATH="~/.cabal:$PATH"

test -r /home/jon/opam-coq/opam-init/init.zsh && . /home/jon/opam-coq/opam-init/init.zsh > /dev/null 2> /dev/null || true
