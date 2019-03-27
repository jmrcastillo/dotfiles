# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="superjarin"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

${ZSH_DISABLE_COMPFIX:=true}

bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete

# virtualwrapper
WORKON_HOME=~/alhamdulillah
PROJECT_HOME=~/alhamdulillah
source /usr/local/bin/virtualenvwrapper.sh

#if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]];then
#	source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

[ -z "$TMUX" ] && export TERM=xterm-256color

# Disable Ctrl-s for freezing in vim - ctrl-q
stty -ixon

## neovim
#alias nvim='nvim -c "source .config/nvim/init.vim"'

# Keybinds
source ~/dotfiles/zsh/keybindings.sh

#GIT ALIASES
alias gst='git status'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias ga='git add'
alias gaa='git add .'
alias gre='git reset'
alias gt='git tree'
#
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff | vim'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'


# TMUX ALIASES
alias tks='tmux kill-session -t'
alias tls='tmux list-session'
alias tas='tmux attach -t'
#RELOAD ZSH
#   source ~/.zshrc

# Tmuxinator
export EDITOR='vim'
#source ~/.bin/tmuxinator.zsh

# environment variables django heroku
export DB_USER="my_db_user"
export DB_PASSWORD="my_db_pass_123!"

# zshrc vi mode
#export KEYTIMEOUT=20
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode

# show status
#function zle-line-init zle-keymap-select {
	#RPS1="${${KEYMAP/vicmd/ -- NORMAL -- }/(main|viins)/ -- INSERT --}"
	#RPS2=$RPS1
	#zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

#source /home/yhvh/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
