#!/usr/bin/env fish
# shellcheck shell=fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Ensure oh-my-fish is installed
# if test ! -d "$HOME/.local/share/fish/plugins/oh-my-fish"
#     curl -LSs "https://get.oh-my.fish" >"$HOME/.config/fish/omf-install"
#     fish "$HOME/.config/fish/omf-install --offline --path=$HOME/.local/share/fish/plugins/oh-my-fish --config=$HOME/.config/omf --noninteractive --yes"
#     fish -c "$HOME/.config/fish/plugins.fish"
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.config/fish/environment/00-global.fish"
    source "$HOME/.config/fish/environment/00-global.fish"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function __cmd_exists -d 'Check if command exists'
    type $argv
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# set env
set -g -x GPG_TTY (tty)
set -g -x PAGER 'less -X'
set -g -x EDITOR myeditor
set -g -x RUBYOPT rubygems
set -g -x COMMAND_MODE unix2003
set -g -x NVM_BIN "$HOME/.local/bin"
set -g -x GOPATH "$HOME/.local/share/go"
set -g -x NVM_DIR "$HOME/.local/share/nodejs/nvm"
set -g -x JAVA_OPTIONS "-Djava.awt.headless=true"
set -g -x MAVEN_OPTS "-Xmx2048m -Xss2M -XX:ReservedCodeCacheSize=128m"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# create dirs
mkdir -p "$HOME/.local/log" "$HOME/.local/bin" "$HOME/.local/share/nodejs/nvm"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.sudo"
    touch "$HOME/.sudo"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# functions / profile / Abbreviations {{{
# Optimized: Skip empty files with test -s
if test -d "$HOME/.config/fish/functions"
    for source_user_file in "$HOME/.config/fish/functions"/*.fish
        test -s "$source_user_file"; and source "$source_user_file"
    end
end
if test -d "$HOME/.config/fish/alias"
    for source_user_file in "$HOME/.config/fish/alias"/*.fish
        test -s "$source_user_file"; and source "$source_user_file"
    end
end
if test -d "$HOME/.config/fish/profile"
    for source_user_file in "$HOME/.config/fish/profile"/*.fish
        test -s "$source_user_file"; and source "$source_user_file"
    end
end
if test -d "$HOME/.config/fish/completions"
    for source_user_file in "$HOME/.config/fish/completions"/*.fish
        test -s "$source_user_file"; and source "$source_user_file"
    end
end
# }}}
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Completions {{{
function make_completion --argument alias command
    complete -c $alias -xa "(
        set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
        complete -C\"$command \$cmd\";
    )"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
complete -c s -w ssh
complete -c cw -w which
complete -c ew -w which
complete -c gw -w which
# }}}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Bind Keys {{{
# Backwards compatibility?  Screw that, it's more important that our function
# names have underscores so they look pretty.
function jesus_fucking_christ_bind_the_fucking_keys_fish
    bind \cn accept-autosuggestion
    bind \cw backward-kill-word
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function fish_user_keybindings
    jesus_fucking_christ_bind_the_fucking_keys_fish
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function fish_user_key_bindings
    jesus_fucking_christ_bind_the_fucking_keys_fish
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Less Colors for Man Pages (optimized for light/dark backgrounds)
# Begin blinking - red
set -g -x LESS_TERMCAP_mb (printf '\e[01;31m')
# Begin bold - cyan (works on both backgrounds)
set -g -x LESS_TERMCAP_md (printf '\e[01;36m')
# End mode
set -g -x LESS_TERMCAP_me (printf '\e[0m')
# End standout-mode
set -g -x LESS_TERMCAP_se (printf '\e[0m')
# Begin standout-mode - magenta (works on both backgrounds)
set -g -x LESS_TERMCAP_so (printf '\e[01;35m')
# End underline
set -g -x LESS_TERMCAP_ue (printf '\e[0m')
# Begin underline - green (works on both backgrounds)
set -g -x LESS_TERMCAP_us (printf '\e[04;32m')
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_nvm yes
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%H:%M"
set -g theme_project_dir_length 0
set -g theme_newline_prompt ' ><((°>)) 🐧 '
set -U SXHKD_SHELL sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.config/local/fish.local"
    source "$HOME/.config/local/fish.local"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.config/local/fish.servers.local"
    source "$HOME/.config/local/fish.servers.local"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.config/local/fish.(hostname -s).local"
    source "$HOME/.config/local/fish.(hostname -s).local"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -f "$HOME/.local/share/fish/plugins/oh-my-fish/init.fish"
    source "$HOME/.local/share/fish/plugins/oh-my-fish/init.fish"
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
printf '\x1b[\x35 q\e]12;cyan\a' 2>/dev/null
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
true
