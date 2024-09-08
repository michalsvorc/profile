#===============================================================================
# fd integration with toggling between files and directories.
#
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md
#===============================================================================

fzf-fd() {
  fd --type file |
    fzf --prompt 'Files> ' \
      --header 'CTRL-T: Switch between Files/Directories' \
      --bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ Files ]] &&
              echo "change-prompt(Files> )+reload(fd --type file)" ||
              echo "change-prompt(Directories> )+reload(fd --type directory)"' \
      --bind 'ctrl-o:become($EDITOR {})' \
      --preview '[[ $FZF_PROMPT =~ Files ]] && $CMD_PAGER {} || $CMD_LIST_DIR {}'
}
