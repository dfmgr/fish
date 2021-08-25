function epp -d "Edit personal .plan"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    switch (hostname)
        case alephnull
            cd ~/.local/share/editors/plan
        case '*'
            cd ~/.local/share/editors/plan
    end
    hg pull -u
    vim README.md
    hg ci -m Update
    hg pa
    cd -
end
