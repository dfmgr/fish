#!/usr/bin/env fish
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031500-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  fisher --help
# @@Copyright        :  Copyright: (c) 2026 Jason Hempstead, Casjays Developments
# @@Created          :  Thursday, Sep 03, 2026 14:00 EDT
# @@File             :  fisher.fish
# @@Description      :  Completions for the fisher plugin manager
# @@Changelog        :  Standardized header block to the new double-@ template
# @@TODO             :  Refactor code
# @@Other            :  
# @@Resource         :  
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/fish
# - - - - - - - - - - - - - - - - - - - - - - - -
complete --command fisher --exclusive --long help --description "Print help"
complete --command fisher --exclusive --long version --description "Print version"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments install --description "Install plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments update --description "Update installed plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments remove --description "Remove installed plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments list --description "List installed plugins matching regex"
complete --command fisher --exclusive --condition "__fish_seen_subcommand_from update remove" --arguments "(fisher list)"
