#!/bin/sh

prefix=$(echo "\
(box
:class 'buttons'
:orientation 'h'
:space-evenly true
:halign 'start'
:vexpand true
:spacing 4"\
| tr '\n' ' ')

workspace_change="hyprctl dispatch workspace"

ws() {
    current_workspace=$(\
	hyprctl activeworkspace\
	| grep -o 'workspace ID [0-9]\+'\
	| awk '{print $NF}'\
    )

    work_nums=$(\
	hyprctl workspaces\
	| grep -o 'workspace ID [0-9]\+'\
	| awk '{print $NF}'
    )

    buttons=$(
	echo "$work_nums"\
	| sort -n\
	| while read num; do
	    button="(button :class '%s' :onclick '$workspace_change %d' '%d') "
	    if [ "$num" = "$current_workspace" ]; then
		printf "$button" "active" "$num" "$num"
	    else
		printf "$button" "normal" "$num" "$num"
	    fi
	done
    )

    output=$(echo "${prefix}${buttons})")
    echo "$output"
}

ws

HYPRLAND_SIGNATURE_ACTUAL=$(ls -td /run/user/1000/hypr/*/ | head -n1 | xargs basename)
SOCKET="/run/user/1000/hypr/${HYPRLAND_SIGNATURE_ACTUAL}/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET" 2>&1 | while read -r line; do
    case $line in
        "workspace>>"*|"createworkspace>>"*|"destroyworkspace>>"*)
            ws
        ;;
    esac
done
