function trademark -d "show trademark"
    if cmd_exists pbcopy
        echo -n ™ | clipboard
    else if cmd_exists pbcopy
        echo -n ™ | pbcopy
    else if cmd_exists xclip
        echo -n ™ | xclip
    else
        echo ™
    end
end
