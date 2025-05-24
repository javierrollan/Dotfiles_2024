if [ -z "$TMUX" ];then
    SESSION_NAME="Main"
     typeset -A WINDOW_DIRS=(
        ["Cyber"]="/home/$USER/Proyectos/Cyber"
        ["Falco"]="/home/$USER/Proyectos/Cyber/Falco"
        ["Ansible"]="/home/$USER/Proyectos/Cyber/Praetor-Cybersecurity/Praetor-Cybersecurity-Infrastructure/ansible-playbooks"
        ["Terraform"]="/home/$USER/Proyectos/Cyber/Praetor-Cybersecurity/Praetor-Cybersecurity-Infrastructure/terraform-playbooks"
        #["Postman"]="/home/$USER/Tools/Postman"
        ["NVIM"]="/home/$USER/.config/nvim"
        ["System"]="/home/$USER/Proyectos/Scripts"
    )
    if ! tmux has-session -t "$SESSION_NAME" 2> /dev/null;then
        tmux new-session -d -s "$SESSION_NAME" -n "Home"
        window_index=1
        for window_name dir in "${(@kv)WINDOW_DIRS}";do
            tmux new-window -t "$SESSION_NAME" -n "$window_name"
            tmux send-keys -t "$SESSION_NAME:$window_index.0" "cd $dir" C-m
            tmux send-keys -t "$SESSION_NAME:$window_index.0" "clear" C-m
            # Split Scripts Window in 3 panes and set working dir
            if [ $window_name = "System" ];then
                tmux select-window -t "$SESSION_NAME:$window_index.0"
                tmux splitw -bf
                tmux splitw -fh
                tmux splitw -b
                tmux send-keys -t "$SESSION_NAME:$window_index.0" "cd /home/$USER/Tools/Scripts/FileSync" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.0" "clear" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.0" "./file-sync.sh" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.1" "htop" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.2" "cd $dir" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.2" "clear" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.3" "cd /home/$USER/Proyectos/BlueTeamHero" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.3" "export FLASK_APP=app.py" C-m
                tmux send-keys -t "$SESSION_NAME:$window_index.3" "flask run --host=192.168.1.51 --port=5000 --debug" C-m
            fi
            ((window_index++))
        done
    fi
    tmux attach-session -t "$SESSION_NAME"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/$HOME/go/bin

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
alias rfv=/opt/fzf/rfv2

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# fnm
FNM_PATH="/home/javier/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/javier/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#414559,label:#C6D0F5"

# Completions
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(fzf --zsh)
