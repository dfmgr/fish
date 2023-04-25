function pbcopy -d 'setup clipboard'
    if __cmd_exists -q clipboard
        cat - | clipboard
    else if __cmd_exists -q pbcopy
        cat - | pbcopy
    else if __cmd_exists -q xclip
        cat - | xclip
    else
        cat -
    end
end
