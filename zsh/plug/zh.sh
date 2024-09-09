function z() {
    : zhcomp
    T="$@"
    withcache zhcomp "$T" |
        tee >(cat) |
        jq -r .completed.text |
        clip
}

function zj() {
    : translate "zh -> ja"
    T="$@"
    withcache translate -t ja "$T" |
        tee >(cat) |
        jq -r .text |
        clip
}
function jz() {
    : translate "ja -> zh"
    T="$@"
    withcache translate -t zh "$T" |
        tee >(cat) |
        jq -r .text |
        clip
}
function zv() {
    : zh-vrchat
    T="$@"
    zhcomp "$T" |
        tee >(cat) |
        jq -r .completed.text |
        vrchatbox
}
