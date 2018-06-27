CALENDAR_HOME=$HOME/Dropbox/cal
function c {
  calendar -f $CALENDAR_HOME/index.calendar --color $@
  NOTIFY=$HOME/Dropbox/bin/slack-calendar
  [ -f $NOTIFY ] && $NOTIFY >/dev/null
}
