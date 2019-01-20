#
# Report Exec time (when it takes over ** sec)
#

last_command=
last_time_prompt=$(date "+%s")
time_report_threshold_sec=30

function preexec_lastcommand() {
    last_command=$1
    last_time_prompt=$(date "+%s")
}

function precmd_timereport() {
    cur_time_prompt=$(date "+%s")
    duration="$(( cur_time_prompt - last_time_prompt ))"
    last_time_prompt=$cur_time_prompt

    if (( duration > time_report_threshold_sec )); then
        echo "Time: $duration sec: $last_command"
        case $last_command in
            vi* | less* | more* | man* | zsh* | bash* )
                :
                ;;
            * )
                notify --title "Finished ($duration sec)" "$last_command" --sound
                ;;
        esac
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_timereport
add-zsh-hook preexec preexec_lastcommand
