#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2026 Jason Hempstead, Casjays Developments
# @@Created          :  Thursday, September 03, 2026 15:00 EDT
# @@File             :  plugins.fish
# @@Description      :  Install oh-my-fish plugin manager and configured plugins
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
# Ensure oh-my-fish is installed
if am_i_online
    # if test ! -d "$HOME/.local/share/fish/plugins/oh-my-fish"
    #     curl -LSs https://get.oh-my.fish >"$HOME/.config/fish/omf-install"
    #     fish "$HOME/.config/fish/omf-install" --path="$HOME/.local/share/fish/plugins/oh-my-fish" --config="$HOME/.config/omf" --noninteractive --yes
    #     fish -c "$HOME/.config/fish/plugins.fish"
    # end

    fish -c "omf install \
local-config \
autovenv \
coffeeandcode \
fish_logo \
gitstatus \
bobthefish \
fonts \
foreign-env \
https://github.com/edc/bass \
https://github.com/jhillyerd/plugin-git \
https://github.com/h-matsuo/fish-color-scheme-switcher"

    fish -c "fonts install --powerline"
    fish -c "omf update"
    true
end
