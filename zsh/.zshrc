# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         cp
         ripgrep
         zsh-syntax-highlighting
         zsh-autosuggestions
         autojump
         fzf-tab)



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


##################################################
# User configuration
##################################################
source $ZSH/oh-my-zsh.sh

export EDITOR='emacsclient -c'
bindkey -e

setopt nobeep

##################################################
# caps_lock -> ctrl
##################################################

setxkbmap -option caps:ctrl_modifier


##################################################
# zsh-syntax-highlight
##################################################

ZSH_HIGHLIGHT_STYLES[default]=fg=cyan
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[path]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[comment]=fg=gray,bold


##################################################
# fzf
##################################################
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --info=inline --min-height=10 --bind ctrl-b:preview-up,ctrl-f:preview-down,alt-v:half-page-up,ctrl-v:half-page-down,alt-b:preview-half-page-up,alt-f:preview-half-page-down'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :100 {}'"
export FZF_ALT_C_OPTS="--preview 'exa -T -L 2 --color=always $realpath| head -100'"
source "/usr/share/fzf/key-bindings.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##################################################
# fzf-tab
##################################################

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
FZF_PREVIEW_CMD='if [ -f $realpath ]; then bat --color=always --style=numbers --line-range=:100 $realpath; else exa -T -L 2 --color=always $realpath; fi'
zstyle ':fzf-tab:complete:cd:*' fzf-preview ${FZF_PREVIEW_CMD}
zstyle ':fzf-tab:complete:ls:*' fzf-preview ${FZF_PREVIEW_CMD}
zstyle ':fzf-tab:complete:exa:*' fzf-preview ${FZF_PREVIEW_CMD}
zstyle ':fzf-tab:complete:cat:*' fzf-preview ${FZF_PREVIEW_CMD}
zstyle ':fzf-tab:complete:bat:*' fzf-preview ${FZF_PREVIEW_CMD}
zstyle ':fzf-tab:*' fzf-pad 10
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-a:toggle-all'
zstyle ':fzf-tab:*' continuous-trigger 'tab'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null


##################################################
# Key-binding
##################################################

bindkey '^T' transpose-chars
bindkey '\ec' capitalize-word
bindkey '\el' down-case-word
bindkey '^x^f' fzf-file-widget # f for file
bindkey '^x^z' fzf-cd-widget # j for jump
bindkey '^F' forward-char
bindkey -r "^J"
bindkey -r "^O"

##################################################
# Alias
##################################################

alias ls="exa -l --icons -s modified"
alias cat="bat"

# opam configuration
[[ ! -r /home/yayu/.opam/opam-init/init.zsh ]] || source /home/yayu/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Codon compiler path (added by install script)
export PATH=/home/yayu/.codon/bin:$PATH

export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH

eval "$(starship init zsh)"
