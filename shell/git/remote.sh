#===============================================================================
# List remote refs for Git remote 'origin'.
# Available refs:
#   - branch
#   - tag
#
# Dependencies: git, column
#===============================================================================

git-remote() {
  local remote_name='origin'
  local format='%(refname:short) %(objectname:short) %(committerdate:iso8601) %(committeremail)'

  if [[ "$1" == "branch" ]]; then
    local ref_type="refs/remotes/${remote_name}/"
  elif [[ "$1" == "tag" ]]; then
    local ref_type="refs/tags/"
  else
    echo "Usage: git-remote <branch|tag>"
    return 1
  fi

  git for-each-ref \
    --sort=-committerdate \
    --format="${format}" \
    "${ref_type}" |
    column -t
}
