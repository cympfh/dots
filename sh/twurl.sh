# vim:set ft=sh:

TWURL=~/git/twurl/bin/twurl
alias twurl='~/git/twurl/bin/twurl'

function tw() {
  if [ -n "$1" ]; then
    msg=$1
  else
    read msg
    while read line; do
      msg="$msg\n$line"
    done
  fi
  ${TWURL} -X POST "/1.1/statuses/update.json" -d "status=$msg" >/dev/null 2>&1
}

function tw-media() {
  ${TWURL} -X POST "/1.1/statuses/update_with_media.json" --file "$2" --file-field "media[]" -d "status=$1"
  echo
}

function tw-url() {
  URL=$2
  LOC="/tmp/${URL##*/}"
  wget --quiet -O $LOC  $URL
  ${TWURL} -X POST "/1.1/statuses/update_with_media.json" --file $LOC --file-field "media[]" -d "status=$1"
  echo
}

# tw-rep-url kenkyo_yushu 573320366833078273 http://cympfh.cc/tool/neta/img/B3l1EeuCEAEAdXu.jpg
function tw-rep-url() {
  URL=$3
  LOC="/tmp/${URL##*/}"
  wget --quiet -O $LOC  $URL
  ${TWURL} -X POST "/1.1/statuses/update_with_media.json" --file $LOC --file-field "media[]" -d "in_reply_to_status_id=$2" -d "status=@$1"
  echo
}

function tw-ls() {
  ${TWURL} accounts
}

function tw-cd() {
  ${TWURL} set default $1
}

function tw-home() {
  $TWURL /1.1/statuses/home_timeline.json > /tmp/home.json
  node -e 'require("/tmp/home.json").forEach(function(o){console.log("@%s\n\t%s", o.user.screen_name, o.text)})'
}

function tw-auth() {
  $TWURL authorize -c qnNRwjeo8zFjhIDfgG1F6Q -s JtKRv1e9QIEG6mKvWl0g4ygGVGzWclgfd7GaSBEGtg # | sed -e 's/^Go to //' -e 's/ and paste in the supplied PIN//'`
}

