###########
#  ZSHRC  #
###########

# Dircolors
eval "$(dircolors "$HOME/.dir_colors")"

# fpath=("$HOME/.zsh" $fpath)

# If you come from bash you might have to change your $PATH.
# export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [ "$TERM" != "linux" ]; then
  # Set name of the theme to load. Optionally, if you set this to "random"
  # it'll load a random theme each time that oh-my-zsh is loaded.
  # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  ZSH_THEME="agnoster"
fi

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


#####################
#  plugin settings  #
#####################

# bgnotify settings
bgnotify_threshold=1  ## set your own notification threshold
bgnotify_formatted() {
  ## $1=exit_status, $2=command, $3=elapsed_time
  [ $1 -eq 0 ] && title="Zsh" || title="Zsh (fail)"
  bgnotify "$title (${3}s)" "$2"
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting zsh-completions command-not-found custom-common-aliases colorize bgnotify)

# Completions
source "$HOME/.completion.zsh"

# Oh-My-Zsh
source "$ZSH/oh-my-zsh.sh"

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


############
#  custom  #
############

# Zsh options
setopt extendedglob
setopt complete_aliases
setopt hist_ignore_space
setopt no_auto_cd

# No scrolllock
stty -ixon

# Highlighting
source "$HOME/.highlight.zsh"

# Aliases
source "$HOME/.alias.zsh"

# Export
source "$HOME/.env.sh"

# FZF
source "$HOME/.fzf.zsh"

# Gruvbox colors fix
source "$HOME/.bin/fix-gruvbox-palette"

# TMUX
main_attached="$(tmux list-sessions -F '#S #{session_attached}' \
  2>/dev/null \
  | sed -n 's/^main[[:space:]]//p')"
if [ ! "$main_attached" -gt '0' ] && [ ! "$TERM" = 'linux' ]; then
  tmux attach -t main >/dev/null 2>&1 || tmux new -s main >/dev/null 2>&1
  exit
fi

# Alternative prompt
if [[ "$TERM" == "linux" ]]; then
  PROMPT='[%F{red}%B%n%b%f@%m %~]'
  PROMPT+='$(git_prompt_info)'
  PROMPT+=' %(?.%F{cyan}.%F{red})%B%(!.#.$)%b%f '
  ZSH_THEME_GIT_PROMPT_PREFIX=" [%F{yellow}%B"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%b%f]"
  ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}%B*%b%f"
  ZSH_THEME_GIT_PROMPT_CLEAN=""
fi
