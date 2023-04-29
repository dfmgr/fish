#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202304251902-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.com
# @@License          :  LICENSE.md
# @@ReadME           :  00-functions.fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Tuesday, Apr 25, 2023 19:12 EDT
# @@File             :  00-functions.fish
# @@Description      :  Default fish functions
# @@Changelog        :  newScript
# @@TODO             :  Refactor code
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  bash/system
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function cmd_exists -d 'Check if command exists'
    type $argv
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Icons
set -g ICON_INFO "[ ℹ️ ]"
set -g ICON_GOOD "[ ✔ ]"
set -g ICON_WARN "[ ❗ ]"
set -g ICON_ERROR "[ ✖ ]"
set -g ICON_QUESTION "[ ❓ ]"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function printf_color -d 'colorize output'
    test $argv[2] && set -l DEFAULT_COLOR $argv[2]
    printf "%b" "$(tput setaf $DEFAULT_COLOR 2>/dev/null)" "$argv[1]\n" "$(tput sgr0 2>/dev/null)"
end

function printf_normal
    printf_color "$argv[1]" 0
end

function printf_green
    printf_color "$argv[1]" 2
end

function printf_red
    printf_color "$argv[1]" 1
end

function printf_purple
    printf_color "$argv[1]" 5
end

function printf_yellow
    printf_color "$argv[1]" 3
end

function printf_blue
    printf_color "$argv[1]" 4
end

function printf_cyan
    printf_color "$argv[1]" 6
end

function printf_info
    printf_color "$ICON_INFO $argv[1]\n" 3
end

function printf_success
    printf_color "$ICON_GOOD $argv[1]\n" 2
end

function printf_error
    printf_color "$ICON_ERROR $argv[1] $argv[2]\n" 1
end

function printf_warning
    printf_color "$ICON_WARN $argv[1]\n" 3
end

function printf_question
    printf_color "$ICON_QUESTION $argv[1] " 6
end

function printf_error_stream
    while read -r line
        do printf_error "↳ ERROR: $line"
    end
end

function printf_execute_success
    printf_color "$ICON_ERROR $argv[1] " 2
end

function printf_execute_error
    printf_color "$ICON_ERROR $argv[1] $argv[2] " 1
end

function printf_execute_error_stream
    while read -r line
        do printf_execute_error "↳ ERROR: $line"
    end
end

function printf_exit
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 1
    set -l msg "$argv"
    printf_color "$msg" "$color"
    echo ""
    return 0
end

function printf_help
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 4
    set -l msg "$argv"
    echo ""
    printf_color "$msg\n" "$color"
    echo ""
    return 0
end

function printf_pause
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 5
    set -l msg "$argv"
    printf_color "$msg " "$color"
    read -r -n 1 -s
    printf "\n"
end

function printf_custom
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 5
    set -l msg "$argv"
    printf_color "$msg" "$color"
    echo ""
end

function printf_read
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 6
    while read line
        do
        printf_color "$line" "$color"
    end
    printf "\n"
end

function printf_readline
    test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color 6
    while read line
        do
        printf_color "$line\n" "$color"
    end
end
