function idea -d "Record an idea"
    mkdir -p ~/.local/share/editors/plan >/dev/null 2>&1
    hg -R ~/.local/share/editors/plan pull -u
    echo $argv >> ~/.local/share/editors/plan/IDEAS.txt
    hg -R ~/.local/share/editors/plan ci -m 'Update'
    hg -R ~/.local/share/editors/plan push
    hg -R ~/.local/share/editors/plan push git
end
