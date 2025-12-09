#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202412091517-git
# @@Author           :  Jason Hempstead
# @@Contact          :  jason@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish_prompt.fish --help
# @@Copyright        :  Copyright: (c) 2024 Jason Hempstead, Casjays Developments
# @@Created          :  Monday, Dec 09, 2024 15:17 EST
# @@File             :  fish_prompt.fish
# @@Description      :  Custom prompt matching bash powerline style
# @@Changelog        :  newScript
# @@TODO             :  Refactor code
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function fish_prompt --description 'Custom powerline-style prompt matching bash'
    # Save last exit status
    set -l last_status $status
    
    # Colors matching bash prompt (using bright variants)
    set -l color_bg_purple '\e[45m'
    set -l color_bg_red '\e[41m'
    set -l color_bg_green '\e[42m'
    set -l color_bg_yellow '\e[43m'
    set -l color_bg_magenta '\e[45m'
    set -l color_bg_blue '\e[44m'
    set -l color_fg_white '\e[97m'
    set -l color_fg_black '\e[30m'
    set -l color_reset '\e[0m'
    
    # Prompt parts
    set -l prompt_parts
    
    # OS/Shell version icon
    set -l shell_icon "🐧"
    set prompt_parts $prompt_parts "$color_bg_blue$color_fg_white $shell_icon Fish $FISH_VERSION $color_reset"
    
    # PHP version
    if type -q php
        set -l php_ver (php -v 2>/dev/null | head -1 | awk '{print $2}' | cut -d- -f1)
        if test -n "$php_ver"
            set prompt_parts $prompt_parts "$color_bg_purple$color_fg_white PHP:$php_ver $color_reset"
        end
    end
    
    # Ruby version
    if type -q ruby
        set -l ruby_ver (ruby -v 2>/dev/null | awk '{print $2}')
        if test -n "$ruby_ver"
            set prompt_parts $prompt_parts "$color_bg_red$color_fg_white Ruby:$ruby_ver $color_reset"
        end
    end
    
    # Node version
    if type -q node
        set -l node_ver (node -v 2>/dev/null | tr -d 'v')
        if test -n "$node_ver"
            set prompt_parts $prompt_parts "$color_bg_green$color_fg_black Node:$node_ver $color_reset"
        end
    end
    
    # Python version
    if type -q python3
        set -l python_ver (python3 --version 2>/dev/null | awk '{print $2}')
        if test -n "$python_ver"
            set prompt_parts $prompt_parts "$color_bg_red$color_fg_white Py:$python_ver $color_reset"
        end
    else if type -q python
        set -l python_ver (python --version 2>&1 | awk '{print $2}')
        if test -n "$python_ver"
            set prompt_parts $prompt_parts "$color_bg_red$color_fg_white Py:$python_ver $color_reset"
        end
    end
    
    # Rust version
    if type -q rustc
        set -l rust_ver (rustc --version 2>/dev/null | awk '{print $2}')
        if test -n "$rust_ver"
            set prompt_parts $prompt_parts "$color_bg_red$color_fg_black Rust:$rust_ver $color_reset"
        end
    end
    
    # Go version
    if type -q go
        set -l go_ver (go version 2>/dev/null | awk '{print $3}' | tr -d 'go')
        if test -n "$go_ver"
            set prompt_parts $prompt_parts "$color_bg_yellow$color_fg_black Go:$go_ver $color_reset"
        end
    end
    
    # Git info
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        set -l git_status ""
        
        # Check for changes
        if not git diff --quiet 2>/dev/null
            set git_status "$git_status!"
        end
        if not git diff --cached --quiet 2>/dev/null
            set git_status "$git_status+"
        end
        if test -n (git ls-files --others --exclude-standard 2>/dev/null)
            set git_status "$git_status?"
        end
        
        if test -n "$git_branch"
            set prompt_parts $prompt_parts "$color_bg_magenta$color_fg_white  $git_branch$git_status $color_reset"
        end
    end
    
    # Current directory
    set -l pwd_display (prompt_pwd)
    set prompt_parts $prompt_parts "$color_bg_blue$color_fg_white  $pwd_display $color_reset"
    
    # Print first line with all parts
    for part in $prompt_parts
        echo -n $part
    end
    echo ""
    
    # Second line: prompt character with exit status
    if test $last_status -eq 0
        echo -n " 😇 "
    else
        echo -n " 😔 $color_bg_red$color_fg_white"E:$last_status"$color_reset "
    end
end
