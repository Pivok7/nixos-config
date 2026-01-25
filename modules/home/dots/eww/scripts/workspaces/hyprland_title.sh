SELF_DIR="$(cd "$(dirname "$0")" && pwd)"

# Load function from other script
. ${SELF_DIR}/../utils/print_head.sh

title() {
    FULL_TITLE=$(hyprctl activewindow \
    | grep "title: " \
    | sed 's/^[^:]*: *//')

    TITLE=$(print_head "$FULL_TITLE" 60)
    echo "$TITLE"
}

HYPRLAND_SIGNATURE_ACTUAL=$(ls -td /run/user/1000/hypr/*/ | head -n1 | xargs basename)
SOCKET="/run/user/1000/hypr/${HYPRLAND_SIGNATURE_ACTUAL}/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET" 2>&1 | while read -r line; do
    case $line in
        "activewindow>>"*)
            title
	;;
    esac
done
