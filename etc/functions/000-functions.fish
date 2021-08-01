# #!/usr/bin/env fish
# # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ##@Version       : 202103251632-git
# # @Author        : Jason Hempstead
# # @Contact       : jason@casjaysdev.com
# # @License       : LICENSE.md
# # @ReadME        : 00-functions.bash --help
# # @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# # @Created       : Thursday, Mar 25, 2021 16:41 EDT
# # @File          : 00-functions.bash
# # @Description   :
# # @TODO          :
# # @Other         :
# # @Resource      :
# # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# # Icons
# set -g ICON_INFO "[ ℹ️ ]"
# set -g ICON_GOOD "[ ✔ ]"
# set -g ICON_WARN "[ ❗ ]"
# set -g ICON_ERROR "[ ✖ ]"
# set -g ICON_QUESTION "[ ❓ ]"
# # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# function printf_color
#     printf '%b' "(tput setaf "$argv[2]" 2>/dev/null)" "$argv[1]" "(tput sgr0 2>/dev/null)"
# end
# function printf_normal
#     printf_color "\t\t$argv[1]\n" "0"
# end
# function printf_green
#     printf_color "\t\t$argv[1]\n" 2
# end
# function printf_red
#     printf_color "\t\t$argv[1]\n" 1
# end
# function printf_purple
#     printf_color "\t\t$argv[1]\n" 5
# end
# function printf_yellow
#     printf_color "\t\t$argv[1]\n" 3
# end
# function printf_blue
#     printf_color "\t\t$argv[1]\n" 4
# end
# function printf_cyan()
#     { printf_color "\t\t$argv[1]\n" 6
#   end
#  function   printf_info
#   printf_color "\t\t$ICON_INFO $argv[1]\n" 3
#   end
#  function   printf_success
#   printf_color "\t\t$ICON_GOOD $argv[1]\n" 2
#   end
#  function   printf_error
#   printf_color "\t\t$ICON_ERROR $argv[1] $argv[2]\n" 1
#   end
#   function  printf_warning
#     printf_color "\t\t$ICON_WARN $argv[1]\n" 3
#     end
#   function  printf_question
#  printf_color "\t\t$ICON_QUESTION $argv[1] " 6
#   end
#   function  printf_error_stream
#  while read -r line; do printf_error "↳ ERROR: $line"; done
#   end
#   function  printf_execute_success
#  printf_color "\t\t$ICON_ERROR $argv[1]  \n" 2
#     end
#  function   printf_execute_error
#  printf_color "\t\t$ICON_ERROR $argv[1] $argv[2] \n" 1
# end
# function    printf_execute_error_stream

#   while read -r line; do printf_execute_error "↳ ERROR: $line"; done
#     end

# function printf_exit
#     test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "1"
#     set set -l msg "$argv[]"
#     shift
#     printf_color "\t\t$msg" "$color"
#     echo ""
#     return 0
# end

#  function   printf_help

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]"  || set -l color "4"
#   set -l msg "$argv[*]"
#   shift
#   echo ""
#   printf_color "\t\t$msg\n" "$color"
#   echo ""
#   return 0
# end

#  function   printf_pause

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "5"
#   set -l msg "${*:-Press any key to continue}"
#   printf_color "\t\t$msg " "$color"
#   read -r -n 1 -s
#   printf "\n"
# end

#   function  printf_custom

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "5"
#   set -l msg "$argv[*]"
#   shift
#   printf_color "\t\t$msg" "$color"
#   echo ""
# end

#  function   printf_read

#   set -o pipefail
#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "6"
#   while read line; do
#     printf_color "\t\t$line" "$color"
#   done
#   printf "\n"
#   set +o pipefail
# end

#  function   printf_readline

#   set -o pipefail
#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "6"
#   while read line; do
#     printf_color "\t\t$line\n" "$color"
#   done
#   set +o pipefail
# end

#  function   printf_question

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "4"
#   set -l msg "$argv[*]"
#   shift
#   printf_color "\t\t$ICON_QUESTION $msg? " "$color"
# end

#  function   printf_custom_question

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "1"
#   set -l msg "$argv[*]"
#   shift
#   printf_color "\t\t$msg " "$color"
# end

#  function   printf_answer

#   read -e -r -n "${2:-120}" -s "${1:-__ANSWER}"
#   history -s "${1:-$__ANSWER}"
# end

#     #printf_read_question "color" "message" "maxLines" "answerVar"
#  function   printf_read_question

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "1"
#   set -l msg "$argv[1..-1]"
#   set -l lines "${1:-120}" && shift 1
#   set -l reply "${1:-$__ANSWER}" && shift 1
#   printf_color "\t\t$msg " "$color"
#   printf_answer "$reply" "$lines"
# end

#  function   printf_answer_yes
#  [[ "${1:-$__ANSWER}" =~ ${2:-^[Yy]$} ]] && return 0 || return 1
#   end

#  function   printf_head

#   test -n "$argv[1]" && test -z "$argv[1]//[0-9]/" && set -l color "$argv[1..-1]" || set -l color "6"
#   set -l msg1 "$argv[1..-1]"
#   set -l msg2 "$argv[1..-1]" || msg2=
#   set -l msg3 "$argv[1..-1]" || msg3=
#   set -l msg4 "$argv[1..-1]" || msg4=
#   set -l msg5 "$argv[1..-1]" || msg5=
#   set -l msg6 "$argv[1..-1]" || msg6=
#   set -l msg7 "$argv[1..-1]" || msg7=
#   shift
#   [ -z "$msg1" ] || printf_color "\t\t##################################################\n" "$color"
#   [ -z "$msg1" ] || printf_color "\t\t$msg1\n" "$color"
#   [ -z "$msg2" ] || printf_color "\t\t$msg2\n" "$color"
#   [ -z "$msg3" ] || printf_color "\t\t$msg3\n" "$color"
#   [ -z "$msg4" ] || printf_color "\t\t$msg4\n" "$color"
#   [ -z "$msg5" ] || printf_color "\t\t$msg5\n" "$color"
#   [ -z "$msg6" ] || printf_color "\t\t$msg6\n" "$color"
#   [ -z "$msg7" ] || printf_color "\t\t$msg7\n" "$color"
#   [ -z "$msg1" ] || printf_color "\t\t##################################################\n" "$color"
# }
# end
