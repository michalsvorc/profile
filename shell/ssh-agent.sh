#===============================================================================
# This will run a ssh-agent process if there is not one already,
# and save the output thereof. If there is one running already, we retrieve the
# cached ssh-agent output and evaluate it which will set the necessary
# environment variables. The lifetime of the unlocked keys is set to TTL
# variable.
#
# Source: https://wiki.archlinux.org/title/SSH_keys#SSH_agents
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

ttl_default='1h'
agent_env_file='ssh-agent.env'
runtime_dir="$XDG_RUNTIME_DIR"
runtime_dir_fallback="/tmp/$UID"

#===============================================================================
# Execution
#===============================================================================

ttl="${1:-$ttl_default}"

[[ -z "$runtime_dir" ]] \
  && mkdir -p "$runtime_dir_fallback" \
  && runtime_dir="$runruntime_dir_fallback"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t "$ttl" > "${runtime_dir}/${agent_env_file}"
fi

if [[ -z "$SSH_AUTH_SOCK" ]]; then
  source "${runtime_dir}/${agent_env_file}" >/dev/null
fi
