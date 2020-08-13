function ej() {
  grep "^$1" ~/Dropbox/share/EngJa | sed 's/\t /\n  /; s/ \/ /\n  /g'
}
function je() {
  grep "$1" ~/Dropbox/share/EngJa | sed 's/\t /\n  /; s/ \/ /\n  /g'
}
