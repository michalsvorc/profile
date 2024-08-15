#===============================================================================
# Change directory to ancestor
# https://www.reddit.com/r/commandline/comments/1cbj6sg/simple_cli_utility_to_cd_to_a_particular_ancestor/
#
# Dependencies: cat
#===============================================================================

cdanc() {
  cmd="cat"
  [[ $1 == -r ]] && {
    cmd=tac
    shift
  }
  occ=1
  [[ $2 =~ ^[0-9]+$ ]] && occ=$2

  p="${PWD}"
  cd "$(
    while [[ $p != "${HOME}" ]]; do
      p=${p%/*}
      echo "${p}"
    done | grep -E "$1[^/]*$" | $cmd | sed -ne "${occ}p"
  )" || return
}
