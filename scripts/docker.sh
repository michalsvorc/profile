#!/usr/bin/env bash
#
# Author: Michal Svorc (https://michalsvorc.com)
# License: MIT license (https://opensource.org/licenses/MIT)
# Dependencies: docker, git

#===============================================================================
# Abort the script on errors and unbound variables
#===============================================================================

set -o errexit      # Abort on nonzero exit status.
set -o nounset      # Abort on unbound variable.
set -o pipefail     # Don't hide errors within pipes.
# set -o xtrace       # Set debugging.

#===============================================================================
# Variables
#===============================================================================

readonly version='1.7.0'
readonly argv0=${0##*/}

# Environments
readonly env_base='base'
readonly env_nodejs='nodejs'
readonly env_python='python'
readonly env_golang='golang'
readonly env_default="$env_base"

# Image
readonly image_name='devcontainer'

# User
readonly user_name='guest'
readonly user_profile_default='https://github.com/michalsvorc/profile'

# Registry
readonly registry_host_default='dockerhub.com'

# Network
readonly network='bridge'

#===============================================================================
# Functions
#===============================================================================

usage() {
  cat <<EOF
Shell script to automate Docker tasks.

Usage:
  ${argv0} [options] build [arguments]
  ${argv0} [options] run [arguments]
  ${argv0} [options] push [registry_host]

Options:
  -h, --help            Show this screen.

  --version             Show version.

  -e, --env <string>
                        Set development container environment.
                        Available values:
                          ${env_base}
                          ${env_nodejs}
                          ${env_python}
                          ${env_golang}
                        Default: ${env_default}

  -p, --user-profile <URL>
                        Git repository URL with user profile configuration files.
                        Used only during base environment build.
                        Default: ${user_profile_default}

  -t, --tag <string>    Set custom image tag.

Commands:
  build                 Build an image.

  run                   Create a container and start interactive shell.

  push                  Tag an image and push it to registry.
                        Default registry: ${registry_host_default}

Arguments:
  Docker CLI arguments.
EOF
  exit ${1:-0}
}

die() {
  local message="$1"

  printf 'Error: %s\n\n' "$message" >&2

  usage 1 1>&2
}

print_version() {
  printf '%s version: %s\n' "$argv0" "$version"
}

get_project_root_dir() {
  local script_dir=$(dirname "$0")

  printf '%s' "$(cd "$script_dir" && git rev-parse --show-toplevel)"
}

create_image_handle() {
  local image_tag="$1"

  printf '%s:%s' "$image_name" "$image_tag"
}

docker_build() {
  local image_tag="$1"
  local dockerfile="${2:-Dockerfile}"
  local user_profile="$3"
  local rest_args="$4"
  local project_root_dir=$(get_project_root_dir)
  local image_handle=$(create_image_handle "$image_tag")

  printf 'Building image "%s" from Dockerfile "%s".\n' \
    "$image_handle" \
    "$dockerfile"

  DOCKER_BUILDKIT=1 \
    docker build \
    --file "${project_root_dir}/dockerfiles/${dockerfile}" \
    --build-arg user_name="$user_name" \
    --build-arg user_profile="$user_profile" \
    --tag "$image_handle" \
    ${rest_args} \
    "$project_root_dir"
}

docker_push() {
  local image_tag="$1"
  local registry_host="$2"
  local image_handle=$(create_image_handle "$image_tag")
  local registry_uri="${registry_host}/${image_handle}"

  printf 'Pushing "%s".\n' "$registry_uri"

  docker image tag \
    "$image_handle" "$registry_uri" \
    && docker push "$registry_uri"
}

docker_run() {
  local image_tag="$1"
  local rest_args="$2"
  local image_handle=$(create_image_handle "$image_tag")
  local container_name="$(printf '%s' "${image_handle//[\/:]/-}")"

  docker_network_inspect

  printf 'Creating container "%s" from image "%s".\n' \
    "$container_name" \
    "$image_handle"

  docker run \
    -it \
    --name "$container_name" \
    --network "$network" \
    ${rest_args} \
    "$image_handle"
}

docker_network_inspect() {
  docker network inspect "$network" &> /dev/null \
    || die "$(
      printf 'Network "%s" not found.\n' "$network" \
      && printf 'Run "docker network create %s" command.' "$network"
    )"
}

#===============================================================================
# Execution
#===============================================================================

test $# -eq 0 && die 'No arguments provided.'

env="$env_default"

while test $# -gt 0 ; do
  case "${1:-}" in
    -h | --help )
      usage 0
      ;;
    --version )
      print_version
      exit 0
      ;;
    -e | --env )
      shift
      test $# -eq 0 && die 'Missing argument for option "--env".'

      env="$1"

      case "${env:-}" in
        "$env_base" | "$env_nodejs" | "$env_python" | "$env_golang" )
          ;;
        * )
          die "$(
            printf 'Unrecognized value "%s" for option "--env".' \
            "${env#-}"
          )"
          ;;
      esac

      shift
      test $# -eq 0 && die 'Missing "command" argument.'
      ;;
    -p | --user-profile )
      shift
      test $# -eq 0 && die 'Missing argument for option "--user-profile".'
      user_profile="${1:-}"

      shift
      test $# -eq 0 && die 'Missing "command" argument.'
      ;;
    -t | --tag )
      shift
      test $# -eq 0 && die 'Missing argument for option "--tag".'
      image_tag="${1:-}"

      shift
      test $# -eq 0 && die 'Missing "command" argument.'
      ;;
    build)
      image_tag="${image_tag:-$env}"
      user_profile="${user_profile:-$user_profile_default}"
      dockerfile="Dockerfile.${env}"
      rest_args="${@:2}"

      docker_build \
        "$image_tag" \
        "$dockerfile" \
        "$user_profile" \
        "$rest_args"
      break
      ;;
    push)
      image_tag="${image_tag:-$env}"
      registry_host="${2:-$registry_host_default}"

      docker_push \
        "$image_tag" \
        "$registry_host"
      break
      ;;
    run)
      image_tag="${image_tag:-$env}"
      rest_args="${@:2}"

      docker_run \
        "$image_tag" \
        "$rest_args"
      break
      ;;
    * )
      die "$(printf 'Unrecognized argument "%s".' "${1#-}")"
      ;;
  esac
done

