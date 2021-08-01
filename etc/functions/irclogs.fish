function irclogs -d "Open the IRC logs dir in vim"
    if test -d ~/.weechat/logs/
        cd ~/.weechat/logs/
        vim .
        cd -
    else
        echo "weechat log dir doesn't exist"
    end
end
