#!/usr/bin/env bash

function main
{
    ! { source "${BASH_SOURCE[0]//${0##*/}}../display/notify.sh" && \
        source "${BASH_SOURCE[0]//${0##*/}}../display/format.sh"; } && \
            exit 1

    title_parts=("yabai")
    subtitle_parts=()
    message_parts=("Restarting yabai")

    title="$(format "${title_parts[@]}")"
    subtitle="$(format "${subtitle_parts[@]}")"
    message="$(format "${message_parts[@]}")"

    notify "${title:-}" "${subtitle:-}" "${message:-}"
    brew services restart yabai
}

main
