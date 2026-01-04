#!/usr/bin/env bash
set -euo pipefail

export UTILS3D_DIR="${UTILS3D_DIR:-/opt/3dutils}"
source "${UTILS3D_DIR}/src/bashrc.sh"

if [[ $# -eq 0 ]]; then
    exec bash
fi

if declare -F "$1" >/dev/null 2>&1; then
    function_name="$1"
    shift
    exec bash -lc "source \"${UTILS3D_DIR}/src/bashrc.sh\"; ${function_name} \"\$@\"" -- "$@"
fi

exec "$@"
