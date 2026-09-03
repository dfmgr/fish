#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  add2path.fish
# @@Description      :  Prepend the given dir to PATH if it exists and is not already added
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function add2path -d "Prepend the given dir to PATH if it exists and is not already in added"
    if test -d $argv[1]
        set -l dir (realpath "$argv[1]")
        if not contains $dir $PATH
            printf_cyan "Added $dir to path"
            set -gx PATH "$dir" $PATH
            return 0
        else
            printf_yellow "$dir is already in the path"
            return 1
        end
    else
        printf_purple "Usage add2path [directory]"
    end
end
