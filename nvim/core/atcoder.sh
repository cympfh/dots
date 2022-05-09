#!/bin/bash

action=
problem_id=
sample_id=

# args
while [ $# -gt 0 ]; do
  case "$1" in
    test | submit | status )
      action=$1
      shift
      ;;
    --problem-id )
      problem_id=$2
      shift 2
      ;;
    --sample-id )
      sample_id=$2
      shift 2
      ;;
    * )
      echo Usage Error
      exit 1
      ;;
  esac
done

atcoder_test() {
  cargo atcoder test $problem_id $sample_id
}

atcoder_submit() {
  cargo atcoder submit $problem_id
}

atcoder_status() {
  timeout 1 cargo atcoder status
}

case "$action" in
  status )
    atcoder_status
    ;;
  test )
    atcoder_test
    ;;
  submit )
    atcoder_submit
    atcoder_status
    ;;
  * )
    echo "Choose Action" >&2
    exit 1
    ;;
esac

echo -n "> bye"
read
