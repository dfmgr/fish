function upper -d "uppercase input"
    if __cmd_exists -q gsed
        gsed -e 's/./\U\0/g' $argv
    else
        sed -e 's/./\U\0/g' $argv
    end
end
