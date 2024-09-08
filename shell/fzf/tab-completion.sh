#===============================================================================
# Custom options for fzf tab completion.
# https://github.com/lincheney/fzf-tab-completion?tab=readme-ov-file#specifying-custom-fzf-options
#===============================================================================

zstyle ':completion::*:cd::*' fzf-completion-opts --preview='eval $CMD_LIST_DIR --tree {1}'
zstyle ':completion::*:bat::*' fzf-completion-opts --preview='eval $CMD_PAGER {1}'
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
