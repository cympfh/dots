function z() {
    : zhcomp
    T="$@"
    zhcomp "$T" |
        tee >(cat) |
        jq -r .completed.text |
        clip
}

function zj() {
    : translate "zh -> ja"
    T="$@"
    translate -t ja "$T" |
        tee >(cat) |
        jq -r .text |
        clip
}
function jz() {
    : translate "ja -> zh"
    T="$@"
    translate -t zh "$T" |
        tee >(cat) |
        jq -r .text |
        clip
}
