# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="wezm++"

COMPLETION_WAITING_DOTS="true"

if ! type "brew" > /dev/null && [ -d '/opt/homebrew' ]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

if type "brew" > /dev/null; then
    plugins=(git macos emoji-clock node npm python autojump vi-mode)
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

    if [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
        . /usr/local/opt/asdf/libexec/asdf.sh
    fi
else
    plugins=(git emoji-clock node npm python ssh-agent vi-mode)
    [[ -s $HOME/etc/profile.d/autojump.sh ]] && . $HOME/etc/profile.d/autojump.sh
fi

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

export PATH="/usr/local/sbin:$PATH"

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
bindkey -M viins 'kj' vi-cmd-mode
bindkey -r '^a'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pauljohnson/Programming/google-cloud-sdk/path.zsh.inc' ]; then 
    . '/Users/pauljohnson/Programming/google-cloud-sdk/path.zsh.inc'; 
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pauljohnson/Programming/google-cloud-sdk/completion.zsh.inc' ]; then 
    . '/Users/pauljohnson/Programming/google-cloud-sdk/completion.zsh.inc'; 
fi

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

if type "pyenv" > /dev/null; then
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if type "fnm" > /dev/null; then
  eval "$(fnm env --use-on-cd)"
elif [[ -d ~/.fnm ]]; then
  export PATH="$PATH:$HOME/.fnm"
fi

[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

if type "kubectl" > /dev/null; then
  source <(kubectl completion zsh)
fi

# alias lsl="exa -1lFagh --group-diretories-first "
# alias lsa="exa -1lFagh --git --group-directories-first "
# alias lst="exa -Ta -L 3 --group-directories-first"
# alias lsg="exa -x --group-directories-first"
# alias ls="lsl"
