function trademark -d "show trademark"
    if __cmd_exists -q clipboard
        echo -n ™ | clipboard
    else if __cmd_exists -q pbcopy
        echo -n ™ | pbcopy
    else if __cmd_exists -q xclip
        echo -n ™ | xclip
    else
        echo ™
    end
end
