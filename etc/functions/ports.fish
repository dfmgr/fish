#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  ports.fish
# @@Description      :  List processes listening on various ports
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  yes
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function ports -d "List processes listening on various ports"
    if __cmd_exists -q lsof
        sudo lsof -iTCP -sTCP:LISTEN -P -n
    else if __cmd_exists -q netstat
        sudo netstat -tlnp
    end
end
