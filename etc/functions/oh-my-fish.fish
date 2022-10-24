function oh-my-fish -d 'Oh my fish setup'
    if am_i_online
        if test ! -d "$HOME/.local/share/fish/oh-my-fish"
            curl -LSs https://get.oh-my.fish >"$HOME/.config/fish/omf-install"
            fish "$HOME/.config/fish/omf-install" --path="$HOME/.local/share/fish/oh-my-fish" --config="$HOME/.config/omf" --noninteractive --yes
            fish -c "$HOME/.config/fish/plugins.fish"
        end
    end
    if cmd_exists omf
        omf $argv
    else
        printf "OhMyFish doesn't seem to be installed\n"
    end
end
