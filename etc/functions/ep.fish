#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fish --help
# @@Copyright        :  Copyright: (c) 2023 Jason Hempstead, Casjays Developments
# @@Created          :  Saturday, Apr 29, 2023 19:32 EDT
# @@File             :  ep.fish
# @@Description      :  Edit .plan
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
function ep -d "Edit .plan"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    switch (hostname)
        case alephnull
            cd ~/.local/share/editors/plan
            nvim README.markdown
            make
            git cm Update -a
            git push origin master
            cd -
        case '*'
            hg -R ~/.local/share/editors/plan pull -u
            vim ~/.local/share/editors/plan/README.md
            hg -R ~/.local/share/editors/plan ci -m Update
            hg -R ~/.local/share/editors/plan push
            hg -R ~/.local/share/editors/plan push git
    end
end
