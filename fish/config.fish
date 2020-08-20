fish_vi_key_bindings
#kitty + complete setup fish | source
set fish_color_param normal
set fish_color_command normal
set fish_color_autosuggestion normal
set fish_color_quote normal
set fish_color_error normal
set fish_color_redirection normal
set fish_color_end normal
# disable prompt modifier by virtuelenv
set --export VIRTUAL_ENV_DISABLE_PROMPT 'True'
# Aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vrc="nvim /home/koopa/dotfiles/nvim/init.vim"
alias vbib="nvim /home/koopa/latex/Bibliothek.bib"
alias vconf="nvim /home/koopa/dotfiles/config"
alias vf="vifm"
alias sr="sudo -E ranger"
alias h="htop -d5"
alias grep="grep --color=auto"
alias nf="neofetch"
alias cu="checkupdates | less"
alias e="exit"
alias ls="ls --color=auto --group-directories-first"
alias lsa="ls -a"
alias lla="ls -al"
alias ..="cd .."
alias ...="cd ../.."
alias pup="yay -Syu"
alias p="yay"
alias cpc="cleanpaccache"
alias ipe="curl ipinfo.io/country; and curl ipinfo.io/ip"
alias lsenum="ls | wc -l"
alias speed="speedtest --simple"

# Abbreveations
abbr sdv "sudo --preserve-env nvim"
abbr sde "sudo --preserve-env"
abbr yv "youtube-viewer"
abbr yl "youtube-dl"
abbr g "git"
abbr scl "systemctl"
