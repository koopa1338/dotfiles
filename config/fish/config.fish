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
set --export GIT_ASKPASS '/usr/lib/ssh/gnome-ssh-askpass3'
# Aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vbib="nvim /home/koopa/latex/Bibliothek.bib"
alias vf="vifm"
alias h="htop -d5"
alias mc="macchina"
alias cu="checkupdates | less"
alias ls="exa"
alias lsa="exa -a"
alias ll="exa -ghl"
alias lla="exa -aghl"
alias ..="cd .."
alias ...="cd ../.."
alias pup="paru -Syu"
alias p="paru"
alias cpc="cleanpaccache"
alias ipe="curl ipinfo.io/country; and curl ipinfo.io/ip"
alias lsenum="exa | wc -l"
alias speed="speedtest --simple"
alias kxc="keepassxc-cli"

# Abbreveations
abbr sde "sudoedit"
abbr g "git"
abbr scl "systemctl"
