#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  idea.fish
# @@Description      :  Record an idea
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function idea -d "Record an idea"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    hg -R ~/.local/share/editors/plan pull -u
    echo $argv >>~/.local/share/editors/plan/IDEAS.txt
    hg -R ~/.local/share/editors/plan ci -m Update
    hg -R ~/.local/share/editors/plan push
    hg -R ~/.local/share/editors/plan push git
end
