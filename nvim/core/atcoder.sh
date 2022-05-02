#!/bin/bash

action=
problem_id=
width=

# args
while [ $# -gt 0 ]; do
  case "$1" in
    test | submit | status )
      action=$1
      shift
      ;;
    --width )
      width=$2
      shift 2
      ;;
    --problem-id )
      problem_id=$2
      shift 2
      ;;
    * )
      echo Usage Error
      exit 1
      ;;
  esac
done

width_inner=$(( width - 2 ))

frame_top() {
  echo -n "╭"
  yes | head -n $width_inner | tr -d '\n' | sed 's/./─/g'
  echo "╮"
}

frame_mid() {
  echo -n "┣"
  yes | head -n $width_inner | tr -d '\n' | sed 's/./─/g'
  echo "┫"
}

frame_bot() {
  echo -n "┗"
  yes | head -n $width_inner | tr -d '\n' | sed 's/./─/g'
  echo "┛"
}

atcoder_test() {
  cargo atcoder test $problem_id | sed 's/^/│ /g'
}

atcoder_submit() {
  cargo atcoder submit $problem_id | sed 's/^/│ /g'
}

atcoder_status() {
  timeout 1 cargo atcoder status
}

case "$action" in
  status )
    frame_top
    atcoder_status
    frame_bot
    ;;
  test )
    frame_top
    atcoder_test
    frame_bot
    ;;
  submit )
    frame_top
    atcoder_submit
    frame_mid
    atcoder_status
    frame_bot
    ;;
esac

echo
echo -n "OK? > "
read
