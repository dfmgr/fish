#!/usr/bin/env fish
# shellcheck shell=fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202304291932-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  oh-my-fish.fish
# @@Description      :  newScript
# @@Changelog        :  newScript
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shell check options
# shellcheck disable=SC2317
# shellcheck disable=SC2120
# shellcheck disable=SC2155
# shellcheck disable=SC2199
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function oh-my-fish -d 'Oh my fish setup'
    if am_i_online
        if test ! -d "$HOME/.local/share/fish/plugins/oh-my-fish"
            set -l omf_installer (command mktemp)
            curl -LSs "https://get.oh-my.fish" >"$omf_installer"
            fish "$omf_installer" --path="$HOME/.local/share/fish/plugins/oh-my-fish" --config="$HOME/.config/omf" --noninteractive --yes
            command rm -f "$omf_installer"
            fish -c "$HOME/.config/fish/plugins.fish"
        end
    end
    if __cmd_exists -q omf
        omf $argv
    else
        printf "OhMyFish doesn't seem to be installed\n"
    end
end
