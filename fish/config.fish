fish_vi_key_bindings
set fish_color_param normal
set fish_color_command normal
set fish_color_autosuggestion normal
set fish_color_quote normal
set fish_color_error normal
set fish_color_redirection normal
set fish_color_end normal
# disable prompt modifier by virtuelenv
set --export VIRTUAL_ENV_DISABLE_PROMPT 'True'
set --export FZF_DEFAULT_COMMAND 'fd -t f'
# Aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vbib="nvim /home/koopa/latex/Bibliothek.bib"
alias vf="vifm"
alias h="htop -d5"
alias nf="neofetch"
alias cu="checkupdates | less"
alias ls="exa"
alias lsa="exa -a"
alias ll="exa -ghl"
alias lla="exa -aghl"
alias ..="cd .."
alias ...="cd ../.."
alias pup="yay -Syu"
alias p="yay"
alias cpc="cleanpaccache"
alias ipe="curl ipinfo.io/country; and curl ipinfo.io/ip"
alias lsenum="exa | wc -l"
alias speed="speedtest --simple"

# Abbreveations
abbr sdv "sudo -E nvim"
abbr sde "sudo -E"
abbr g "git"
abbr scl "systemctl"
