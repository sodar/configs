#!/bin/bash

function main() {
    set -euo pipefail

    local ssh_env_path="${HOME}/.ssh-agent-thing"

    if [ -f "${ssh_env_path}" ]; then
        eval "$(< ${ssh_env_path})"
        echo "ssh-agent env vars refreshed (from '${ssh_env_path}')"
    else
        echo "No .ssh-agent-thing in '${ssh_env_path}'"
    fi

    set +euo pipefail
}

main
