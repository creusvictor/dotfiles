# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent agent-forwarding yes

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
plugins=(ansible argocd azure docker docker-compose eza git gcloud helm httpie kitty kubectl python redis-cli ssh tailscale taskwarrior terraform tmux vagrant zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
 export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
#
#Exports
export PATH="$HOME/go/bin:$PATH"
export EDITOR="vim"
export GEMINI_API_KEY="AIzaSyBcInlG62Swpsv4b85mhN8TqYmJ7Fk2dsc"
export OPENAI_API_KEY="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"
export GOOGLE_CLIENT_ID="994598579379-4f6s7chbd51t1aocunab9msuedm8n004.apps.googleusercontent.com"
export GOOGLE_SECRET_ID="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"
export DATADOPE_MAIL="victor.creus@datadope.io"
export DATADOPE_NEXUS_ENDPOINT="nexusregistry.opensolutions.cloud"
export DATADOPE_NEXUS_API_KEY="124d9691-6966-341f-a4a2-61236ebf1492"

#Functions
datadope-nexus ()
{
	docker login $DATADOPE_NEXUS_ENDPOINT --username $DATADOPE_MAIL --password $DATADOPE_NEXUS_API_KEY
	helm registry login $DATADOPE_NEXUS_ENDPOINT --username $DATADOPE_MAIL --password $DATADOPE_NEXUS_API_KEY
}
datadope-vault ()
{
	VAULT_ADDR=https://blue.datadope.io vault login -method=oidc
}
fcc-vault ()
{
	VAULT_ADDR=https://vault.fcc.intfcc.local vault login -tls-skip-verify $(VAULT_ADDR=https://blue.datadope.io vault kv get -field=root_token fcc/iometrics/pro/vault)
}

# Aliases
alias zshrc="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cat='bat --theme="Solarized (dark)"'
alias vagrant='TERM=xterm-256color vagrant'
alias icat='kitten icat'
alias ssh='ggh'
alias xclip='xclip -sel clip'
alias weather='curl wttr.in/Barcelona'
alias python='python3'
alias gcal='gcalcli'
alias lgit='lazygit'
#
#
#
# Oh-my-Posh
export PATH=$PATH:/home/victor/.local/bin
eval "$(oh-my-posh init zsh --config "/home/victor/creusvictor_oh_my_posh/creusvictor.omp.json" )"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

