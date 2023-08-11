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
# @@File             :  epp.fish
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
function epp -d "Edit personal .plan"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    switch (hostname)
        case alephnull
            cd ~/.local/share/editors/plan
        case '*'
            cd ~/.local/share/editors/plan
    end
    hg pull -u
    vim README.md
    hg ci -m Update
    hg pa
    cd -
end
