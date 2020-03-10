#RELOAD ZSH
#   source ~/.zshrc

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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

#Python
alias python='python3.6'
alias python3='python3.6'
alias pym='python -m '
alias pyi='python -i '
#alias pip='pip3'

# virtualwrapper
#WORKON_HOME=~/Envs
#MSYS_HOME=~/Envs/jibreel
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#source /usr/local/bin/virtualenvwrapper.sh

#if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]];then
#	source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

# TMUX
[ -z "$TMUX" ] && export TERM=xterm-256color
alias tdv='~/dotfiles/tmux/tmux/tmux-dev'

# Disable Ctrl-s for freezing in vim - ctrl-q
stty -ixon

# pipenv
alias pen="pipenv "
alias psh='pipenv shell '
alias prn='pipenv run python '
alias pin='pipenv install '
alias pgr='pipenv graph '
# pip list
alias pfr='pipenv lock -r '
alias pli='pip list'
alias plc='pipenv lock '
alias pun='pipenv uninstall '
alias prm='pipenv --rm '
alias ext='exit'

## neovim
#alias nvim='nvim -c "source .config/nvim/init.vim"'

# zsh plugins
# Keybinds
source ~/dotfiles/zsh/keybindings.sh

#GIT ALIASES

# git add message
alias ga='git add'
alias gaa='git add .'
alias gst='git status'
alias gcm='git commit -m'
alias gcam='git commit -am'

# git reset
alias gre='git reset --hard HEAD~'
alias gro='git reset --hard '
alias gru='git reset --hard ORIG_HEAD'

# git decorate
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit -n 27'
alias gta='git log --graph --decorate --pretty=oneline --abbrev-commit'

# git push fetch pull
alias gp='git push'
alias gpl='git pull'
alias gfc='git fetch'
alias gpom="git pull origin master"

# git squash
alias grb="git rebase -i HEAD~6"
# change pick to squash
# - pick
# - squash
# - squash

# git branch
alias ggb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gco='git checkout'

# git remote
alias grv='git remote -v'
alias gra='git remote add '
# gra ssh-bb git@bitbucket.org:jmrcastillo/dotfiles.git
alias grr='git remote remove '
# grr origin
alias grs='git remote show '
# grs ssh-bb

# git diff show in vim
alias gdv='git diff . | vi -'

# remove git
alias grm='rm -rf .git'

# heroku
alias hrb="git commit --allow-empty -m 'empty commit' && git push heroku master"

# IP
alias ipc='ip -c a'
alias ipr='ip route'
alias ipm='ip maddr'

### TERMINAL SHORTCUT

# sudo
alias sai='sudo apt-get install '
alias sud='sudo apt-get update '
alias sug='sudo apt-get upgrade '

# Edit vim zsh
alias vis='cd ~/dotfiles/vim/ && vi'
alias nvs='cd ~/.config/nvim/ && nv init.vim'
alias ezs='vi ~/dotfiles/zsh/.zshrc'
alias etm='vi ~/.tmux.conf'

# ls
alias lsa='ls -al' 		# list all files
alias lsr='ls -l'
alias lsd='ls -ld */'		# list only directories
alias lss='ls | sort'
alias lsg='ls -a | grep '	# list and grep
alias fsd='find . -type f -name "*.sw[klmnop]" -delete'

# nautilus
alias nts='nautilus .'
alias tre='tree'

# kill
alias pkl='pkill -f '

# TMUX ALIASES
alias tmx='tmux'
alias tks='tmux kill-session -t'
alias tls='tmux list-session'
alias tas='tmux attach -t'

# vim alias
alias vi='vim'
alias nv='nvim'

# Tmuxinator
export EDITOR='vim'
#source ~/.bin/tmuxinator.zsh

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

# LINUX UBUNTU SUBSYSTEM
alias who='cd /mnt/c/Users/yhvh/'
alias mnte='cd /mnt/e/0\ -\ Today\ IChoose\ 2019/Windows10'

# username
#PROMPT="%{% ${PROMPT}"

# jibreel@dm [] ~
# PROMPT="%{$fg_bold[cyan]%} jibreel@%n % ${PROMPT}"

# jibreel@dm ~
# PROMPT="%{$fg_bold[cyan]%} %n% ${PROMPT} "
