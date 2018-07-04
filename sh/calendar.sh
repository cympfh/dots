CALENDAR_HOME=$HOME/Dropbox/cal
function c {
  calendar -f $CALENDAR_HOME/index.calendar --color $@

  if [ "_$1" != "_-N" -a "_$1" != "_-n" ]; then
      NOTIFY=$HOME/Dropbox/bin/slack-calendar
      [ -f $NOTIFY ] && $NOTIFY >/dev/null
  fi
}
