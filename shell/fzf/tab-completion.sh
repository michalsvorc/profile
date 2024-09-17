#===============================================================================
# Custom options for fzf tab completion.
# https://github.com/lincheney/fzf-tab-completion?tab=readme-ov-file#specifying-custom-fzf-options
#===============================================================================

preview_dir='eval $CMD_LIST_DIR --tree --level 1 {1}'
preview_file='eval $CMD_PAGER {1}'
preview_dynamic="[[ -d {2} ]] && ${preview_dir} || ([[ -f {2} ]] && eval ${preview_file})"

zstyle ':completion::*:bat::*' fzf-completion-opts --preview="${preview_dynamic}"
zstyle ':completion::*:cp::*' fzf-completion-opts --preview="${preview_dynamic}"
zstyle ':completion::*:cd::*' fzf-completion-opts --preview="${preview_dir}"
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
zstyle ':completion::*:nvim::*' fzf-completion-opts --preview="${preview_dynamic}"
zstyle ':completion::*:mv::*' fzf-completion-opts --preview="${preview_dynamic}"
zstyle ':completion::*:rm::*' fzf-completion-opts --preview="${preview_dynamic}"
zstyle ':completion::*:stat::*' fzf-completion-opts --preview='stat {2}'
