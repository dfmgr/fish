#!/usr/bin/env fish
# shellcheck shell=fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202304291602-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  00-global.fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 16:02 EDT
# @@File             :  00-global.fish
# @@Description      :  Fish environment settings
# @@Changelog        :  newScript
# @@TODO             :  Refactor code
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set -gx SHELL fish
set -gx USRBINDIR "$HOME/.local/bin"
set -gx SYSBINDIR "/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin:/usr/share/games:/usr/games"
set -gx PATH "$USRBINDIR:$SYSBINDIR"
set -gx TMP "$HOME/.local/tmp"
set -gx TEMP "$HOME/.local/tmp"
set -gx TMPDIR "$HOME/.local/tmp"
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
set -gx LC_TIME "en_US.UTF-8"
set -gx LC_COLLATE "en_US.UTF-8"
set -gx LC_MONETARY "en_US.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_PAPER "en_US.UTF-8"
set -gx LC_NAME "en_US.UTF-8"
set -gx LC_ADDRESS "en_US.UTF-8"
set -gx LC_TELEPHONE "en_US.UTF-8"
set -gx LC_MEASUREMENT "en_US.UTF-8"
set -gx LC_IDENTIFICATION "en_US.UTF-8"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# colors initialization
set -gx color_prompt yes
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Optimized: Use bright ANSI codes for better visibility on both dark and light backgrounds
# Reset
set -gx NC '\e[0m'
set -gx RESET '\e[0m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Bold
set -gx BOLD '\e[1m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Regular Colors (bright variants for better visibility)
set -gx BLACK '\e[0;90m'
set -gx RED '\e[0;91m'
set -gx GREEN '\e[0;92m'
set -gx YELLOW '\e[0;93m'
set -gx BLUE '\e[0;94m'
set -gx PURPLE '\e[0;95m'
set -gx CYAN '\e[0;96m'
set -gx WHITE '\e[0;97m'
set -gx ORANGE '\e[0;93m'
set -gx LIGHTRED '\e[1;91m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Bold (bright variants)
set -gx BBLACK '\e[1;90m'
set -gx BRED '\e[1;91m'
set -gx BGREEN '\e[1;92m'
set -gx BYELLOW '\e[1;93m'
set -gx BBLUE '\e[1;94m'
set -gx BPURPLE '\e[1;95m'
set -gx BCYAN '\e[1;96m'
set -gx BWHITE '\e[1;97m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Underline (bright variants)
set -gx UBLACK '\e[4;90m'
set -gx URED '\e[4;91m'
set -gx UGREEN '\e[4;92m'
set -gx UYELLOW '\e[4;93m'
set -gx UBLUE '\e[4;94m'
set -gx UPURPLE '\e[4;95m'
set -gx UCYAN '\e[4;96m'
set -gx UWHITE '\e[4;97m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Background
set -gx ON_BLACK '\e[40m'
set -gx ON_RED '\e[41m'
set -gx ON_GREEN '\e[42m'
set -gx ON_YELLOW '\e[43m'
set -gx ON_BLUE '\e[44m'
set -gx ON_PURPLE '\e[45m'
set -gx ON_CYAN '\e[46m'
set -gx ON_WHITE '\e[47m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# High Intensity
set -gx IBLACK '\e[0;90m'
set -gx IRED '\e[0;91m'
set -gx IGREEN '\e[0;92m'
set -gx IYELLOW '\e[0;93m'
set -gx IBLUE '\e[0;94m'
set -gx IPURPLE '\e[0;95m'
set -gx ICYAN '\e[0;96m'
set -gx IWHITE '\e[0;97m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Bold High Intensity
set -gx BIBLACK '\e[1;90m'
set -gx BIRED '\e[1;91m'
set -gx BIGREEN '\e[1;92m'
set -gx BIYELLOW '\e[1;93m'
set -gx BIBLUE '\e[1;94m'
set -gx BIPURPLE '\e[1;95m'
set -gx BICYAN '\e[1;96m'
set -gx BIWHITE '\e[1;97m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# High Intensity backgrounds
set -gx ON_IBLACK '\e[0;100m'
set -gx ON_IRED '\e[0;101m'
set -gx ON_IGREEN '\e[0;102m'
set -gx ON_IYELLOW '\e[0;103m'
set -gx ON_IBLUE '\e[0;104m'
set -gx ON_IPURPLE '\e[0;105m'
set -gx ON_ICYAN '\e[0;106m'
set -gx ON_IWHITE '\e[0;107m'
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set -gx DISPLAY_LOW_DENSITY $DISPLAY
set -gx RESOLUTION (type -q xrand && xrandr --current 2>/dev/null | grep '\*' | sort -u | awk '{print $1}'||true)
set -gx XKBOPTIONS "terminate:ctrl_alt_bksp"
set -gx CACHE_DIRECTORY "$HOME/.cache"
set -gx STATE_DIRECTORY "$HOME/.local/lib"
set -gx LOGS_DIRECTORY "$HOME/.local/log"
set -gx RUNTIME_DIRECTORY /run/user/(id -u)
set -gx CONFIGURATION_DIRECTORY "$HOME/.config"
set -gx XDG_RUNTIME_DIR "$RUNTIME_DIRECTORY"
set -gx XDG_CONFIG_HOME "$CONFIGURATION_DIRECTORY"
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK "$RUNTIME_DIRECTORY/gnupg/S.gpg-agent.ssh"
set -gx LESS RcQaix4M
set -gx MANPAGER less "-RcQaix4M +Gg"
set -gx TMP_BIN_PATH "$HOME/.emacs.d/bin:$TMP_BIN_PATH"
set -gx TMP_BIN_PATH "$HOME/.local/share/emacs/plugins/doom-emacs/bin:$TMP_BIN_PATH"
set -gx MPDSERVER "$HOSTNAME"
set -gx NOTES_DIRECTORY "$HOME/.local/share/editors/notes"
set -gx NVIM_LISTEN_ADDRESS "$RUNTIME_DIRECTORY/nvim.{$USER}.sock"
set -gx LUAVER_HOME "$HOME/.local/share/misc/plugins/luaver"
set -gx LUAROCKS_PREFIX "$HOME/.local/share/lua/luarocks"
set -gx LUAROCKS_BIN "$LUAROCKS_PREFIX/bin"
set -gx TMP_BIN_PATH "$LUAROCKS_BIN:$TMP_BIN_PATH"
set -gx ASDF_DIR "$HOME/.local/share/misc/plugins/asdf"
set -gx ASDF_DATA_DIR "$HOME/.local/share/misc/plugins/asdf"
set -gx TMP_BIN_PATH "$HOME/.local/share/misc/plugins/basher/bin:$TMP_BIN_PATH"
set -gx GVM_ROOT $HOME/.local/share/gvm
set -gx GODIR $HOME/.local/share/go
set -gx GOPATH "$GODIR"
set -gx GOBIN "$GODIR/bin"
set -gx GOCACHE "$GODIR/build"
set -gx TMP_BIN_PATH "$GOBIN:$TMP_BIN_PATH"
set -gx GOFISH_CACHE "$HOME/cache/.gofish"
set -gx GOFISH_HOME "$HOME/.local/share/gofish"
set -gx GOFISH_RIGS "$GOFISH_HOME/Rigs"
set -gx GOFISH_BARREL "$GOFISH_HOME/Barrel"
set -gx GOFISH_DEFAULT_RIG "$GOFISH_HOME/Rigs/github.com/fishworks/fish-food"
set -gx rvm_path "$HOME/.local/share/rvm"
set -gx TMP_BIN_PATH "$rvm_path/bin:$TMP_BIN_PATH"
set -gx PNPM_HOME "$HOME/.local/share/nodejs/pnpm"
set -gx TMP_BIN_PATH "$PNPM_HOME:$TMP_BIN_PATH"
set -gx FNM_BIN "$USRBINDIR"
set -gx FNM_DIR "$HOME/.local/share/nodejs/fnm"
set -gx FNM_DEFAULT "$FNM_DIR/aliases/default/bin"
set -gx TMP_BIN_PATH "$FNM_BIN:$TMP_BIN_PATH"
set -gx NVM_BIN "$USRBINDIR"
set -gx NVM_DIR "$HOME/.local/share/nodejs/nvm"
set -gx NO_UPDATE_NOTIFIER true
set -gx NPM_PACKAGES "$HOME/.local/share/nodejs/modules"
set -gx NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set -gx TMP_BIN_PATH "$NPM_PACKAGES/bin:$TMP_BIN_PATH"
set -gx DENO_INSTALL "$HOME/.local/share/deno"
set -gx TMP_BIN_PATH "$DENO_INSTALL/bin:$TMP_BIN_PATH"
set -gx SETV_VIRTUAL_DIR_PATH "$HOME/.local/share/python/setvenv/"
set -gx PIPX_BIN_DIR "$USRBINDIR"
set -gx PIPX_HOME "$HOME/.local/share/python/pipx"
set -gx VIRTUALENVWRAPPER_VIRTUALENV_WORKON_CD yes
set -gx VIRTUALENVWRAPPER_PIP (which pip3 2>/dev/null || which pip 2>/dev/null)
set -gx VIRTUALENVWRAPPER_VIRTUALENV (which venv 2>/dev/null || which virtualenv 2>/dev/null)
set -gx RUST_HOME "$HOME/.local/share/rust"
set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx RUSTUP_HOME "$HOME/.local/share/rustup"
set -gx TMP_BIN_PATH "$TMP_BIN_PATH:$CARGO_HOME/bin:$RUST_HOME/bin:$RUSTUP_HOME/bin"
set -gx VAGRANT_HOME "$HOME/.local/share/vagrant"
set -gx VAGRANT_DEFAULT_PROVIDER libvirt
set -gx TMP_BIN_PATH "$TMP_BIN_PATH:$VAGRANT_HOME/bin"
set -gx KUBECONFIG "$HOME/.config/kube/config"
set -gx DOCKERCONFDIR "$HOME/.config/dockstarter"
set -gx DOCKERMGR_HOME "$HOME/.config/myscripts/dockermgr"
set -gx DBX_HOME "$HOME/.local/share/distrobox"
set -gx TMP_BIN_PATH "$TMP_BIN_PATH:$DBX_HOME/bin"
set -gx DOTNET_ROOT "$HOME/.local/share/dotnet"
set -gx TMP_BIN_PATH "$DOTNET_ROOT:$DOTNET_ROOT/tools:$TMP_BIN_PATH"
set -gx VERSION_DATE_FORMAT "%Y%m%d%H%M-git"
set -gx TODO_DIR "$HOME/.local/share/editors/todos"
set -gx WALLPAPER_DIR "$HOME/.local/share/wallpapers"
set -gx THEME_DIR "$HOME/.local/share/themes"
set -gx ICON_DIR "$HOME/.local/share/icons"
set -gx FONT_DIR "$HOME/.local/share/fonts"
set -gx TERM screen-256color
set -gx DEFAULT_LOG apps
set -gx LOGDIR "$LOGS_DIRECTORY"
set -gx DEFAULT_LOG_DIR "$LOGS_DIRECTORY"
set -gx CASJAYSDEVDIR /usr/local/share/CasjaysDev/scripts
set -gx TMP_BIN_PATH "$CASJAYSDEVDIR/bin:$TMP_BIN_PATH"
set -gx ASCIINEMA_API_URL "https://asciinema.org"
set -gx CHTSH_HOME "$HOME/.config/cheatsh"
set -gx SCREENEXCHANGE "$HOME/.screen-exchange"
set -gx SCREEN_MSGMINWAIT 1
set -gx CLIPBOARD "$HOME/.cache/.clipboard"
set -gx CLMAXHIST 20
set -gx HOMEBREW_INSTALL_BADGE "☕️ 🐸"
set -gx HOMEBREW_CASK_OPTS "--appdir /Applications"
set -gx PROFILERCSRC "$HOME/.profile"

[ -d "$HOME/.config/local" ] || mkdir -p "$HOME/.config/local"
[ -d "$HOME/.config/secure/inc" ] || mkdir -p "$HOME/.config/secure/inc"

which kubectl >/dev/null 2>&1 && kubectl completion fish | source || true
which fnm >/dev/null 2>&1 && fnm env --use-on-cd --shell fish | source >/dev/null || true
which fnm >/dev/null 2>&1 && fnm completions --shell fish | source >/dev/null || true
which podman >/dev/null 2>&1 && set -gx KIND_EXPERIMENTAL_PROVIDER podman || set -gx KIND_EXPERIMENTAL_PROVIDER docker || true
which fixFishPath >/dev/null 2>&1 && set -gx SET_USR_PATH (fixFishPath user "$TMP_BIN_PATH" "$USRBINDIR" "$FNM_MULTISHELL_PATH") || true
[ -f "$rvm_path/scripts/rvm" ] && . "$rvm_path/scripts/rvm"
[ -f "$rvm_path/scripts/completion" ] && . "$rvm_path/scripts/completion"
[ -f "/run/docker/docker.sock" ] && set -gx DOCKER_SOCK "unix:///run/docker/docker.sock" || set -gx DOCKER_SOCK "unix:///run/docker.sock"
set -gx PATH "$SET_USR_PATH:."
set -e -Ug SET_PATH SET_TMP_PATH TMP_BIN_PATH
