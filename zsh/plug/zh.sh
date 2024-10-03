function z() {
    : zhcomp
    T="$@"
    withcache -t -1 -- zhcomp "$T" |
        tee >(cat) |
        jq -r .completed.text |
        clip
}

function zj() {
    : translate "zh -> ja"
    T="$@"
    withcache -t -1 -- translate -t ja "$T" |
        tee >(cat) |
        jq -r .text |
        clip
}
function jz() {
    : translate "ja -> zh"
    T="$@"
    withcache -t -1 -- translate -t zh "$T" |
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
