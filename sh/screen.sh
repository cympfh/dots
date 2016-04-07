case $TERM in
  screen-256color-bce)
    preexec() {
      echo -ne "\ek$1\e\\"
    }
    precmd() {
      #echo -ne "\ek$(basename $SHELL)\e\\"
      echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
    }
    ;;
esac

if [ $TERM = "screen-256color-bce" ]; then
  echo -ne "\ek$(pwd|sed -e 's#/home/[^/]*#~#' -e 's#/Users/[^/]*#~#')\e\\"
fi
