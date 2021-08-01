function lower -d "lowercase input"
    if cmd_exists gsed
        gsed -e 's/./\L\0/g' $argv
    else
        sed -e 's/./\L\0/g' $argv
    end
end
