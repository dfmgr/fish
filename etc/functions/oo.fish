#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  oo.fish
# @@Description      :  Open the current directory
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function oo -d "open ."
    if command -q open
        open .
    else if command -q xdg-open
        xdg-open .
    end
end
