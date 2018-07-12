#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim

alias vpn_gtek='sudo openvpn /etc/openvpn/gtek-vpn.conf'
alias pacman-remove-orphans='pacman -Rns $(pacman -Qtdq)'
alias pacman-list-orphans='pacman -Qtdq'
