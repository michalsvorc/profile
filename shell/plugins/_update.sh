#!/usr/bin/env bash

declare -a array
array=(
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
)

download() {
  local filename="$1"

  curl -JLO "$filename"
}

for url in ${array[@]}
do
  download "$url"
done

