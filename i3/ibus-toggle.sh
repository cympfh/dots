#!/bin/bash

case "$(ibus engine)" in
    xkb:us::eng )
        echo ibus engine mozc-jp
        ibus engine mozc-jp
        ;;
    * )
        echo ibus engine xkb:us::eng
        ibus engine xkb:us::eng
        ;;
esac
