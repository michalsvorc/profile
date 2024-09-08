#===============================================================================
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#ripgrep-integration
# 1. Search for text in files using Ripgrep
# 2. Interactively narrow down the list using fzf
# 3. Open the file in Vim
#
# Dependencies: rg, fzf, cut
#===============================================================================

fzf-rg() {
  rg \
    --hidden \
    --glob "!.git" \
    --line-number \
    --color=always \
    --no-heading \
    --smart-case \
    "${*:-}" |
    fzf \
      --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview '$CMD_PAGER {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' |
    cut -d':' -f1
}
