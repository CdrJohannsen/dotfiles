#env /bin/bash

ls /dev/iio:* &> /dev/null || exit

function rotate {
    case "$1" in
        normal)
            ANGLE=0
            ;;
        bottom-up)
            ANGLE=180
            ;;
        right-up)
            ANGLE=90
            ;;
        left-up)
            ANGLE=270
            ;;
    esac

    swaymsg "output * transform $ANGLE"
}


monitor-sensor --accel | while read -r line; do
    ROT="$(echo $line  | grep "orientation changed" | /bin/grep -oE '[^ ]+$')"

    if [ ! -z $ROT ]; then
        rotate $ROT
    fi
done
