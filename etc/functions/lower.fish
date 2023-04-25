function lower -d "lowercase input"
    if __cmd_exists -q gsed
        gsed -e 's/./\L\0/g' $argv
    else
        sed -e 's/./\L\0/g' $argv
    end
end
