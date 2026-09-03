#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  pj.fish
# @@Description      :  Prettify JSON
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function pj -d "Prettify JSON"
    if test "$argv[1]" = -C
        # no color
        python -m json.tool
    else
        python -m json.tool | pygmentize -l json
    end
end
