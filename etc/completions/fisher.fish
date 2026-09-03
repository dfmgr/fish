#!/usr/bin/env fish
# shellcheck shell=fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202609031400-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : LICENSE.md
# @ReadME        : fisher --help
# @Copyright     : Copyright: (c) 2026 Jason Hempstead, CasjaysDev
# @Created       : Thursday, Sep 03, 2026 14:00 EDT
# @File          : fisher.fish
# @Description   : completions for the fisher plugin manager
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
complete --command fisher --exclusive --long help --description "Print help"
complete --command fisher --exclusive --long version --description "Print version"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments install --description "Install plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments update --description "Update installed plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments remove --description "Remove installed plugins"
complete --command fisher --exclusive --condition __fish_use_subcommand --arguments list --description "List installed plugins matching regex"
complete --command fisher --exclusive --condition "__fish_seen_subcommand_from update remove" --arguments "(fisher list)"
