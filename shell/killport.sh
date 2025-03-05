#===============================================================================
# Kills process at specified port.
#
# Dependencies: lsof, kill
#===============================================================================

killport() {
  PORT=$1

  if [ -z "$PORT" ]; then
    printf 'Error: No port provided.\n'
    printf 'Usage: killport <port>\n'
    return 1
  fi

  PID=$(lsof -t -i:"$PORT")

  if [ -z "$PID" ]; then
    printf 'No process found running on port %s.\n' "$PORT"
    return 1
  fi

  kill -9 "$PID" &&
    printf 'Killed process %s running on port %s.\n' "$PID" "$PORT"
}
