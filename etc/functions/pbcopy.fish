function pbcopy -d 'setup clipboard'
    if cmd_exists clipboard
        cat - | clipboard
    else if cmd_exists pbcopy
        cat - | pbcopy
    else if cmd_exists xclip
        cat - | xclip
    else
        cat -
    end
end
