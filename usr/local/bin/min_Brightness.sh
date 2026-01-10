#!/bin/sh
# Uso:
#   brightness-step.sh -10   -> diminui 10%, com clamp mínimo
#   brightness-step.sh +10   -> aumenta 10%
#   install this script in /usr/lib/min_Brightness take a wrapper brightness in the /usr/bin

MIN_PERCENT=5

STEP="$1"
[ -z "$STEP" ] && exit 1

MAX=$(brightnessctl m) || exit 1
CUR=$(brightnessctl g) || exit 1

MIN=$((MAX * MIN_PERCENT / 100))

case "$STEP" in
    -*)
        STEP_PCT=${STEP#-}

        # Calcula próximo valor percentual
        NEXT=$(( CUR - (MAX * STEP_PCT / 100) ))

        if [ "$NEXT" -le "$MIN" ]; then
            brightnessctl set "$MIN"
        else
            brightnessctl set "${STEP_PCT}%-"
        fi
        ;;
    +*)
        STEP_PCT=${STEP#+}
        brightnessctl set "${STEP_PCT}%+"
        ;;
    *)
        exit 1
        ;;
esac
