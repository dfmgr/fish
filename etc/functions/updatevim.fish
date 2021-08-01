function updatevim -d "update vim"
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
