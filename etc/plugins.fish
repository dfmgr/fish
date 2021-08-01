#!/usr/bin/env fish
# Ensure oh-my-fish is installed
if am_i_online
    # if test ! -d "$HOME/.local/share/fish/oh-my-fish"
    #     curl -LSs https://get.oh-my.fish >"$HOME/.config/fish/omf-install"
    #     fish "$HOME/.config/fish/omf-install" --path="$HOME/.local/share/fish/oh-my-fish" --config="$HOME/.config/omf" --noninteractive --yes
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
