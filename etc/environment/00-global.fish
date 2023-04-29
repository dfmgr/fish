# shellcheck shell fish
#!/usr/bin/env fish

set -g SHELL "fish"
set -g BOLD (tput bold 2>/dev/null)
set -g USRBINDIR "$HOME/.local/bin"
set -g SYSBINDIR "/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin:/usr/share/games:/usr/games"
set -g PATH "$USRBINDIR:$SYSBINDIR"
set -g TMP "$HOME/.local/tmp"
set -g TEMP "$HOME/.local/tmp"
set -g TMPDIR "$HOME/.local/tmp"
set -g LANG "en_US.UTF-8"
set -g LC_CTYPE "en_US.UTF-8"
set -g LC_NUMERIC "en_US.UTF-8"
set -g LC_TIME "en_US.UTF-8"
set -g LC_COLLATE "en_US.UTF-8"
set -g LC_MONETARY "en_US.UTF-8"
set -g LC_MESSAGES "en_US.UTF-8"
set -g LC_PAPER "en_US.UTF-8"
set -g LC_NAME "en_US.UTF-8"
set -g LC_ADDRESS "en_US.UTF-8"
set -g LC_TELEPHONE "en_US.UTF-8"
set -g LC_MEASUREMENT "en_US.UTF-8"
set -g LC_IDENTIFICATION "en_US.UTF-8"
set -g DISPLAY_LOW_DENSITY $DISPLAY
set -g RESOLUTION "(xrandr --current 2>/dev/null | grep '\*' | uniq | awk '{print $1}')"
set -g XKBOPTIONS "terminate:ctrl_alt_bksp"
set -g CACHE_DIRECTORY "$HOME/.cache"
set -g STATE_DIRECTORY "$HOME/.local/lib"
set -g LOGS_DIRECTORY "$HOME/.local/log"
set -g RUNTIME_DIRECTORY "/run/user/$(id -u)"
set -g CONFIGURATION_DIRECTORY "$HOME/.config"
set -g XDG_RUNTIME_DIR "$RUNTIME_DIRECTORY"
set -g XDG_CONFIG_HOME "$CONFIGURATION_DIRECTORY"
set -g GPG_TTY (tty)
set -g SSH_AUTH_SOCK "$RUNTIME_DIRECTORY/gnupg/S.gpg-agent.ssh"
set -g LESS "RcQaix4M"
set -g MANPAGER less "-RcQaix4M +Gg"
set -g TMP_BIN_PATH "$HOME/.emacs.d/bin:$TMP_BIN_PATH"
set -g TMP_BIN_PATH "$HOME/.local/share/emacs/plugins/doom-emacs/bin:$TMP_BIN_PATH"
set -g MPDSERVER "$HOSTNAME"
set -g NOTES_DIRECTORY "$HOME/.local/share/editors/notes"
set -g NVIM_LISTEN_ADDRESS "$RUNTIME_DIRECTORY/nvim.{$USER}.sock"
set -g LUAVER_HOME "$HOME/.local/share/misc/plugins/luaver"
set -g LUAROCKS_PREFIX "$HOME/.local/share/lua/luarocks"
set -g LUAROCKS_BIN "$LUAROCKS_PREFIX/bin"
set -g TMP_BIN_PATH "$LUAROCKS_BIN:$TMP_BIN_PATH"
set -g ASDF_DIR "$HOME/.local/share/misc/plugins/asdf"
set -g ASDF_DATA_DIR "$HOME/.local/share/misc/plugins/asdf"
set -g TMP_BIN_PATH "$HOME/.local/share/misc/plugins/basher/bin:$TMP_BIN_PATH"
set -g GVM_ROOT $HOME/.local/share/gvm
set -g GODIR $HOME/.local/share/go
set -g GOPATH "$GODIR"
set -g GOBIN "$GODIR/bin"
set -g GOCACHE "$GODIR/build"
set -g TMP_BIN_PATH "$GOBIN:$TMP_BIN_PATH"
set -g GOFISH_CACHE "$HOME/cache/.gofish"
set -g GOFISH_HOME "$HOME/.local/share/gofish"
set -g GOFISH_RIGS "$GOFISH_HOME/Rigs"
set -g GOFISH_BARREL "$GOFISH_HOME/Barrel"
set -g GOFISH_DEFAULT_RIG "$GOFISH_HOME/Rigs/github.com/fishworks/fish-food"
set -g rvm_path "$HOME/.local/share/rvm"
set -g TMP_BIN_PATH "$rvm_path/bin:$TMP_BIN_PATH"
set -g GEM_HOME $HOME/.local/share/gem
set -g GEM_PATH (ruby -e 'puts Gem.user_dir')/bin
set -g TMP_BIN_PATH "$GEM_PATH:$TMP_BIN_PATH"
set -g PNPM_HOME "$HOME/.local/share/nodejs/pnpm"
set -g TMP_BIN_PATH "$PNPM_HOME:$TMP_BIN_PATH"
set -g FNM_BIN "$USRBINDIR"
set -g FNM_DIR "$HOME/.local/share/nodejs/fnm"
set -g FNM_DEFAULT "$FNM_DIR/aliases/default/bin"
set -g TMP_BIN_PATH "$FNM_BIN:$TMP_BIN_PATH"
set -g NVM_BIN "$USRBINDIR"
set -g NVM_DIR "$HOME/.local/share/nodejs/nvm"
set -g NO_UPDATE_NOTIFIER true
set -g NPM_PACKAGES "$HOME/.local/share/nodejs/modules"
set -g NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set -g TMP_BIN_PATH "$NPM_PACKAGES/bin:$TMP_BIN_PATH"
set -g DENO_INSTALL "$HOME/.local/share/deno"
set -g TMP_BIN_PATH "$DENO_INSTALL/bin:$TMP_BIN_PATH"
set -g SETV_VIRTUAL_DIR_PATH "$HOME/.local/share/python/setvenv/"
set -g PIPX_BIN_DIR "$USRBINDIR"
set -g PIPX_HOME "$HOME/.local/share/python/pipx"
set -g VIRTUALENVWRAPPER_VIRTUALENV_WORKON_CD "yes"
set -g VIRTUALENVWRAPPER_PIP "(which pip3 2>/dev/null || which pip 2>/dev/null)"
set -g VIRTUALENVWRAPPER_VIRTUALENV "(which venv 2>/dev/null || which virtualenv 2>/dev/null)"
set -g RUST_HOME "$HOME/.local/share/rust"
set -g CARGO_HOME "$HOME/.local/share/cargo"
set -g RUSTUP_HOME "$HOME/.local/share/rustup"
set -g TMP_BIN_PATH "$TMP_BIN_PATH:$CARGO_HOME/bin:$RUST_HOME/bin:$RUSTUP_HOME/bin"
set -g VAGRANT_HOME "$HOME/.local/share/vagrant"
set -g VAGRANT_DEFAULT_PROVIDER "libvirt"
set -g TMP_BIN_PATH "$TMP_BIN_PATH:$VAGRANT_HOME/bin"
set -g KUBECONFIG "$HOME/.config/kube/config"
set -g DOCKERCONFDIR "$HOME/.config/dockstarter"
set -g DOCKERMGR_HOME "$HOME/.config/myscripts/dockermgr"
set -g DBX_HOME "$HOME/.local/share/distrobox"
set -g TMP_BIN_PATH "$TMP_BIN_PATH:$DBX_HOME/bin"
set -g DOTNET_ROOT "$HOME/.local/share/dotnet"
set -g TMP_BIN_PATH $DOTNET_ROOT:$DOTNET_ROOT/tools:$TMP_BIN_PATH
set -g VERSION_DATE_FORMAT %Y%m%d%H%M-git
set -g TODO_DIR $HOME/.local/share/editors/todos
set -g WALLPAPER_DIR $HOME/.local/share/wallpapers
set -g THEME_DIR $HOME/.local/share/themes
set -g ICON_DIR $HOME/.local/share/icons
set -g FONT_DIR $HOME/.local/share/fonts
set -g TERM screen-256color
set -g DEFAULT_LOG apps
set -g LOGDIR $LOGS_DIRECTORY
set -g DEFAULT_LOG_DIR $LOGS_DIRECTORY
set -g CASJAYSDEVDIR $HOME/.local/share/scripts
set -g TMP_BIN_PATH $CASJAYSDEVDIR:$TMP_BIN_PATH
set -g ASCIINEMA_API_URL https://asciinema.org
set -g CHTSH_HOME $HOME/.config/cheatsh
set -g SCREENEXCHANGE "$HOME/.screen-exchange"
set -g SCREEN_MSGMINWAIT 1
set -g CLIPBOARD "$HOME/.cache/.clipboard"
set -g CLMAXHIST 20
set -g HOMEBREW_INSTALL_BADGE "☕️ 🐸"
set -g HOMEBREW_CASK_OPTS "--appdir /Applications"
set -g PROFILERCSRC "$HOME/.profile"

[ -d "$HOME/.config/local" ] || mkdir -p "$HOME/.config/local"
[ -d "$HOME/.config/secure/inc" ] || mkdir -p "$HOME/.config/secure/inc"

which kubectl >/dev/null 2>&1 && kubectl completion fish | source >/dev/null
which fnm >/dev/null 2>&1 && fnm env --use-on-cd | source >/dev/null
which podman >/dev/null 2>&1 && set -g KIND_EXPERIMENTAL_PROVIDER podman || set -g KIND_EXPERIMENTAL_PROVIDER docker
which fixFishPath >/dev/null 2>&1 && set -g SET_USR_PATH "(fixFishPath user "$TMP_BIN_PATH" "$USRBINDIR" "$FNM_MULTISHELL_PATH")"
set -g PATH "$FNM_MULTISHELL_PATH/bin:$SET_USR_PATH:$USRBINDIR:$SYSBINDIR:."
set -e SET_PATH SET_TMP_PATH TMP_BIN_PATH
[ -f "$rvm_path/scripts/rvm" ] && . "$rvm_path/scripts/rvm"
[ -f "$rvm_path/scripts/completion" ] && . "$rvm_path/scripts/completion"
[ -f "/run/docker/docker.sock" ] && set -g DOCKER_SOCK "/run/docker/docker.sock"||set -g DOCKER_SOCK "/run/docker.sock"
