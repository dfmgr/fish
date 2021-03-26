function et -d "Edit TODOs"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    cd ~/.local/share/editors/plan
    vim TODO
    git cm 'Edit TODOs' -a
end
