#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2026 Jason Hempstead, Casjays Developments
# @@Created          :  Thursday, Sep 03, 2026 12:00 EDT
# @@File             :  am_i_online.fish
# @@Description      :  Check if the network is reachable
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function am_i_online -d 'Check if the network is reachable'
    if command -q curl
        curl -s -o /dev/null -m 3 https://github.com
    else if command -q ping
        ping -c 1 -W 2 github.com >/dev/null 2>&1
    else
        return 0
    end
end
