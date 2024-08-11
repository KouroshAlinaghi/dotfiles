set fish_greeting ""

status --is-interactive; 
starship init fish | source

export PATH="$HOME/.cargo/bin:$PATH"
export TZ='Asia/Tehran'
export BAT_THEME="Catppuccin-frappe"
export SUDO_EDITOR=nvim

fzf_configure_bindings --directory=\cf --variables=\cv --history=\ch
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--height 70% --border" 

alias ls='exa --grid --long --no-permissions --git --group-directories-first --icons --group --no-user'

setxkbmap -layout us,ir -option grp:win_space_toggle
