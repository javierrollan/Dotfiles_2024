if [ -z "$TMUX" ];then
    SESSION_NAME="Main"
    WINDOW_NAMES=("Flask" "Jupyter" "Docker" "Postman" "NVIM" "Go" "Cyber")
    if ! tmux has-session -t "$SESSION_NAME" 2> /dev/null;then
        tmux new-session -d -s "$SESSION_NAME" -n "Home"
        for window_name in "${WINDOW_NAMES[@]}";do
            tmux new-window -t "$SESSION_NAME" -n "$window_name"
        done
    fi
    tmux attach-session -t "$SESSION_NAME"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This is another test 12

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	colored-man-pages
	history-substring-search
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.autoenv/activate.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
export AUTOENV_ENABLE_LEAVE=true

# Faster pasting in console
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Export
export TERM=xterm-256color

# Aliases
alias vim=/opt/nvim-linux64/bin/nvim
alias ls=/usr/bin/lsd
alias cat=/usr/bin/batcat

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
