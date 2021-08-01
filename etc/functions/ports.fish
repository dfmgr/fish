function ports -d "List processes listening on various ports"
    if cmd_exists lsof
        sudo lsof -iTCP -sTCP:LISTEN -P -n
    else if cmd_exists netstatl
        sudo netstatl
    end
end
