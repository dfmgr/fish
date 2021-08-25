function upper -d "uppercase input"
    if cmd_exists gsed
        gsed -e 's/./\U\0/g' $argv
    else
        sed -e 's/./\U\0/g' $argv
    end
end
