#===============================================================================
# Change into multiple parent directories
#
# Dependencies: fzf, sed
#===============================================================================

cdup() {
  local -r n_dirs="${1:-1}"
  cd "$(printf "%0.s../" $(seq 1 "$n_dirs"))" || return
}
