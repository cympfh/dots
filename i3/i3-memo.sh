#!/bin/bash

MEMO=/tmp/i3.memo

if [ ! -f $MEMO ]; then
    touch $MEMO
fi

i3-remove() {
    ID="$1"
    sed -i "/^${ID}\t/d" "$MEMO"
}

i3-add() {
    ID="$1"
    MSG="$2"
    i3-remove "$ID"
    printf "$ID\t$MSG\n" >> $MEMO
}

i3-cat() {
    cat $MEMO
}

i3-clean() {
    rm -f "$MEMO"
}

COMMAND="i3-$1"
shift 1
$COMMAND $@
