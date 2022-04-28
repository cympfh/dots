#
# Report Exec time (when it takes over ** sec)
#

last_command=
last_prompt_time=$(date "+%s")
time_report_threshold_sec=30
time_report_waiting=0

sec2htime() {
    sec=$(( $1 % 60 ))
    min=$(( ( $1 / 60 ) % 60 ))
    hour=$(( ( $1 / 60 / 60 ) % 24 ))
    day=$(( $1 / 60 / 60 / 24 ))
    if (( day > 0 )); then
        echo "${day} days ${hour} hr ${min} min ${sec} sec"
    elif (( hour > 0 )); then
        echo "${hour} hr ${min} min ${sec} sec"
    elif (( min > 0 )); then
        echo "${min} min ${sec} sec"
    else
        echo "${sec} sec"
    fi
}

preexec_lastcommand() {
    last_command=$1
    last_prompt_time=$(date "+%s")
    time_report_waiting=1
}

precmd_timereport() {
    cur_prompt_time=$(date "+%s")
    duration="$(( cur_prompt_time - last_prompt_time ))"
    if (( time_report_waiting == 1 && duration > time_report_threshold_sec )); then
        duration_human=$(sec2htime $duration)
        echo "\`$last_command\` finished [$duration_human]"
        # case $last_command in
        #     vi* | less* | more* | man* | zsh* | bash* )
        #         :
        #         ;;
        #     * )
        #         timeout 1 notify --title "Finished [$duration_human]" "$last_command" --sound
        #         ;;
        # esac
    fi
    time_report_waiting=0
}

add-zsh-hook precmd precmd_timereport
add-zsh-hook preexec preexec_lastcommand
