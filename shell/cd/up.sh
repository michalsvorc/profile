#===============================================================================
# Change directory to one of the parent directories.
# https://www.reddit.com/r/commandline/comments/1cbj6sg/simple_cli_utility_to_cd_to_a_particular_ancestor/
#
# Dependencies: cat, fzf, grep
#===============================================================================

cdup() {
  local cmd="cat"
  if [[ $1 == "-r" ]]; then
    cmd="tac"
    shift
  fi

  local p="${PWD}"

  local target_dir
  target_dir=$(while [[ $p != "${HOME}" ]]; do
    p=${p%/*}
    echo "${p}"
  done | grep -E "$1[^/]*$" | $cmd | fzf --reverse --inline-info)

  if [[ -n "$target_dir" ]]; then
    cd "$target_dir" || return
  fi
}
