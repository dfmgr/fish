#!/usr/bin/env sh
# shellcheck shell=sh
# shellcheck disable=SC2139
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202303022155-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : LICENSE.md
# @ReadME        : README.md
# @Copyright     : Copyright: (c) 2023 Jason Hempstead, CasjaysDev
# @Created       : Thursday, Mar 02, 2023 21:54 EDT
# @File          : 00-default.lin
# @Description   :
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# System Aliases
alias q='exit '
alias :q='exit '
alias :q!='exit '
alias :w='history -a '
alias c='clear '
alias ch='history -c &>/dev/null && history -w &>/dev/null '
alias g='git '
alias m='man '
alias map='xargs -n1 '
alias n='npm '
alias t='tmux '
alias tailf='tail -f '
alias mount='mount -l '
alias h='history '
alias j='jobs -l '
alias nowtime='date +"%T" '
alias nowdate='date +"%m-%d-%Y" '
alias wget='wget -c '
alias df='df -H '
alias du='du -ch '
alias setverfile='setver --file '
alias userlist='cut -d: -f1 /etc/passwd '
alias muttsync='mailsync '
alias mutt='neomutt '
alias lynx='lynx -cfg=$HOME/.config/lynx/lynx.cfg -lss=$HOME/.config/lynx/lynx.lss '
alias grep='grep --color=auto '
alias egrep='grep -E --color=auto '
alias fgrep='grep -F --color=auto '
alias cp_rpf='cp --parents -Rfv '
alias less='less -r '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# sudo commands
alias sudo='\sudo -HE --preserve-env=PATH'
alias svi='sudo vim '
alias adb='sudo adb '
alias npmg='sudo npm -g '
alias netstat='sudo netstat '
alias fastboot='sudo fastboot '
alias ipconfig='sudo ifconfig '
alias systemctl='sudo systemctl '
alias ports='sudo netstat -taupln | grep --color=auto LISTEN '
alias flushdns='sudo systemd-resolve --flush-caches '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TMUX
[ -f "$HOME/.config/tmux/singlerc.conf" ] && which tmux >/dev/null 2>&1 && alias tmux-single='tmux -f $HOME/.config/tmux/singlerc.conf new-session -D -A -s single ' || alias tmux-ssh='tmux '
[ -f "$HOME/.config/tmux/tmux.ssh.conf" ] && which tmux >/dev/null 2>&1 && alias tmux-ssh='tmux -f $HOME/.config/tmux/tmux.ssh.conf new-session -D -A -s ssh ' || alias tmux-ssh='tmux '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SCREEN
[ -f "$HOME/.config/screen/dev/sshrc" ] && which screen >/dev/null 2>&1 && alias screen-ssh='\screen -c $HOME/.config/screen/dev/sshrc ' || alias screen-ssh='\screen -t ssh '
[ -f "$HOME/.config/screen/dev/noderc" ] && which screen >/dev/null 2>&1 && alias screen-node='\screen -c $HOME/.config/screen/dev/noderc ' || alias screen-node='\screen -t node '
[ -f "$HOME/.config/screen/singlerc" ] && which screen >/dev/null 2>&1 && alias screen-single='\screen -c $HOME/.config/screen/singlerc ' || alias screen-single='\screen -t single '
[ -f "$HOME/.config/screen/productivityrc" ] && which screen >/dev/null 2>&1 && alias screen-prod='\screen -c $HOME/.config/screen/productivityrc ' || alias screen-single='\screen -t prod '
[ -f "$HOME/.config/screen/dev/developmentrc" ] && which screen >/dev/null 2>&1 && alias screen-dev='\screen -c $HOME/.config/screen/dev/developmentrc ' || alias screen-dev='\screen -t dev '
[ -f "$HOME/.config/screen/other/socialrc" ] && which screen >/dev/null 2>&1 && alias screen-social='\screen -c $HOME/.config/screen/other/socialrc ' || alias screen-social='\screen -t social '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shell
alias profilerc='source ~/.profile '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# zsh specific
[ "$(basename "$SHELL" 2>/dev/null)" = zsh ] && alias zshrc='clear && source ~/.zshrc'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# bash specific
[ "$(basename "$SHELL" 2>/dev/null)" = bash ] && alias inputrc='bind -f ~/.inputrc'
[ "$(basename "$SHELL" 2>/dev/null)" = bash ] && alias bashrc='clear && source ~/.bashrc'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ssh aliases
[ -n "$DISPLAY" ] && alias ssh='ssh -X' || alias ssh='ssh '
[ -n "$DISPLAY" ] && alias sshq='ssh -qX' || alias ssh='ssh -q '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Package management
[ "$(uname -s)" = Linux ] && which apt >/dev/null 2>&1 && alias apt='sudo apt '
[ "$(uname -s)" = Linux ] && which apt-get >/dev/null 2>&1 && alias apt-get='sudo apt-get '
[ "$(uname -s)" = Linux ] && which dnf >/dev/null 2>&1 && alias dnf='sudo dnf '
[ "$(uname -s)" = Linux ] && which yum >/dev/null 2>&1 && alias yum='sudo yum '
[ "$(uname -s)" = Linux ] && which pacman >/dev/null 2>&1 && alias pacman='sudo pacman '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ls
alias ls='ls -h --color=auto '
alias la='ls -hA --color=auto '
alias ll='ls -hl --color=auto '
alias dir='ls -hD --color=auto '
alias lla='ls -hlA --color=auto '
alias l.='ls -hA | grep -E --color=auto '\''^\.'\'' '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CD Aliases
alias ..='\builtin cd ../'
alias cd..='\builtin cd ../'
alias ...='\builtin cd ../../'
alias ....='\builtin cd ../../../'
alias .....='\builtin cd ../../../../'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# VisualStudio code
if which code-oss >/dev/null 2>&1
    alias code='code-oss '
    alias codew='code-oss -w '
    alias code-np='code-oss --disable-extensions '
else if which code-insiders >/dev/null 2>&1
    alias code='code-insiders '
    alias codew='code-insiders -w '
    alias code-np='code-insiders --disable-extensions '
else if which code >/dev/null 2>&1
    alias code='code '
    alias codew='code -w '
    alias code-np='code --disable-extensions '
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Powershell
if which pwsh-preview >/dev/null 2>&1
    alias pwsh='pwsh-preview '
    alias powershell='pwsh-preview '
else if which pwsh >/dev/null 2>&1
    alias powershell='pwsh '
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Set vim
alias vi='vim '
alias vis='vim +set si '
alias svim='sudo vim '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Set neovim
if which nvim >/dev/null 2>&1 && [ -f "$HOME/.config/neovim/init.vim" ]
    alias nvim='nvim -u $HOME/.config/neovim/init.vim'
    alias neovim='nvim -u $HOME/.config/neovim/init.vim'
else if which neovim >/dev/null 2>&1 && [ -f "$HOME/.config/nvim/init.vim" ]
    alias nvim='neovim -u $HOME/.config/nvim/init.vim'
    alias neovim='nvim -u $HOME/.config/neovim/init.vim'
end # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Set docker
which minikube >/dev/null 2>&1 && alias kubectl='minikube kubectl '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# trash aliases.
which trash >/dev/null 2>&1 && alias empty-trash='trash empty ' || alias empty-trash='rm -Rf ~/.local/share/Trash/files/* && ~/.local/share/Trash/files/info/* '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Hide/show icons.
which gsettings >/dev/null 2>&1 && alias desktop-icons-hide='gsettings set org.gnome.desktop.background show-desktop-icons false '
which gsettings >/dev/null 2>&1 && alias desktop-icons-show='gsettings set org.gnome.desktop.background show-desktop-icons true '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lock Screen
which xflock4 >/dev/null 2>&1 && alias afk='xflock4 '
which gnome-screensaver-command >/dev/null 2>&1 && alias afk='gnome-screensaver-command --lock '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# logout
which xfce4-session-logout >/dev/null 2>&1 && alias logout='xfce4-session-logout '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Open command
[ "$(uname -s)" = Linux ] && which xdg-open >/dev/null 2>&1 && alias open='xdg-open '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# youtube-dl
which youtube-dl >/dev/null 2>&1 && alias nightcorea='ytda nightcorea '
which youtube-dl >/dev/null 2>&1 && alias nightcorev='ytda nightcorev '
which youtube-dl >/dev/null 2>&1 && alias ytv-best='ytda ytv '
which youtube-dl >/dev/null 2>&1 && alias yta-aac='ytda aac '
which youtube-dl >/dev/null 2>&1 && alias yta-best='ytda yta '
which youtube-dl >/dev/null 2>&1 && alias yta-flac='ytda flac '
which youtube-dl >/dev/null 2>&1 && alias yta-m4a='ytda m4a '
which youtube-dl >/dev/null 2>&1 && alias yta-mp3='ytda mp3 '
which youtube-dl >/dev/null 2>&1 && alias yta-opus='ytda opus '
which youtube-dl >/dev/null 2>&1 && alias yta-vorbis='ytda vorbis '
which youtube-dl >/dev/null 2>&1 && alias yta-wav='ytda wav '
which youtube-dl >/dev/null 2>&1 && alias ytdv='ytda video '
which youtube-dl >/dev/null 2>&1 && alias ytstream='ytstream '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Media
which castero >/dev/null 2>&1 && alias podcasts='castero '
which spotifyd >/dev/null 2>&1 && alias spotify='spotifyd '
which pianobar >/dev/null 2>&1 && alias pandora='pianobar '
which tizonia >/dev/null 2>&1 && alias cloudplayer='tizonia '
which youtube-viewer >/dev/null 2>&1 && alias youtube='youtube-viewer '
which mpc >/dev/null 2>&1 && [ -z "$MPDSERVER" ] && alias mpc='mpc ' || alias mpc='mpc -h "$MPDSERVER" '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Python
which pipx >/dev/null 2>&1 || alias pipx='pip install -U pipx && alias pipx="pipx" '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Other
which anime-dl >/dev/null 2>&1 && alias anime-cli='anime-dl '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# list functions
alias list-my-functions='typeset -F | less '
alias list-my-aliases='alias | less '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Fun alias
alias tw='rainbowstream -iot '
alias twitter='twitter '
alias mylatlong='mylocation | grep --color=none "LAT\|LON" '
alias emj='emojis '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# other
alias shit='rerun_that -- shit'
alias bork='rerun_that -- bork'
alias balls='rerun_that -- balls'
alias please='rerun_that -- please'
alias gcm='git add . && git commit -am "🗃️ Committing everything that changed 🗃️ " '
alias scripts_update='sudo -n true && sudo git -C /usr/local/share/CasjaysDev/scripts pull -q && printf_green "Scripts has been updated"'
alias copy-templates='scripts_update;gen-header --copy;gen-dns --copy;gen-html --copy;gen-license --copy;gen-readme --copy;gen-script --copy;'
alias update-system='printf_blue "Updating your system. This may take a while......" && pkmgr silent upgrade && sudo systemmgr update &>/dev/null && dfmgr update &>/dev/null && printf_green "Your system has been updated" || printf_red "Failed to update your system" '
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
which thefuck >/dev/null 2>&1 || alias fuck='rerun_that -- fuck'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# end
true
