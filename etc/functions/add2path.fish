function add2path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        set -l dir "$(realpath "$argv[1]")"
        if not contains $argv[1] $PATH
            printf '%b\n' "Added $dir to path"
            set -gx PATH "$argv[1]" $PATH
            return 0
        else
            printf '%b\n' "$dir is already in the path"
            return 1
        end
    else
        printf '%b\n' "Usage add2path [directory]"
    end
end
