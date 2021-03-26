function ep -d "Edit .plan"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    switch (hostname)
    case alephnull
        cd ~/.local/share/editors/plan
        nvim README.markdown
        make
        git cm 'Update' -a
        git push origin master
        cd -
    case '*'
        hg -R ~/.local/share/editors/plan pull -u
        vim ~/.local/share/editors/plan/README.md
        hg -R ~/.local/share/editors/plan ci -m 'Update'
        hg -R ~/.local/share/editors/plan push
        hg -R ~/.local/share/editors/plan push git
    end
end
