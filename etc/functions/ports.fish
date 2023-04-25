function ports -d "List processes listening on various ports"
    if __cmd_exists -q lsof
        sudo lsof -iTCP -sTCP:LISTEN -P -n
    else if __cmd_exists -q netstatl
        sudo netstatl
    end
end
