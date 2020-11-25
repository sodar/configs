#!/bin/bash

set -euo pipefail

function does_process_exist() {
    local pid=$1

    [ -d "/proc/${pid}" ]
}

function is_ssh_agent() {
    local pid=$1
    local exe=$(readlink "/proc/${pid}/exe")

    [ "${exe}" = "/usr/bin/ssh-agent" ]
}

function start_ssh_agent() {
    local path=$1

    echo "Starting ssh-agent (env file forwarded to ${path}"
    ssh-agent > "${path}"
}

function main() {
    local ssh_env_path="${HOME}/.ssh-agent-thing"

    if [ -f "${ssh_env_path}" ]; then
        eval "$(< ${ssh_env_path})" > /dev/null
        # echo "SSH_AGENT_PID=${SSH_AGENT_PID}"
        if does_process_exist "${SSH_AGENT_PID}" && is_ssh_agent "${SSH_AGENT_PID}"; then
            echo "ssh-agent is running with pid ${SSH_AGENT_PID}, please use refresh-ssh-agent"
        else
            echo "Process pointed to by '${ssh_env_path}' is not a ssh-agent"
            start_ssh_agent "${ssh_env_path}"
        fi
    else
        echo "No .ssh-agent-thing in '${ssh_env_path}'"
        start_ssh_agent "${ssh_env_path}"
    fi
}

main
