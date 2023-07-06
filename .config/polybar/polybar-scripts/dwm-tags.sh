#! /bin/bash

back="#303446"
fore="#C6D0F5"
prim="#F4B8E4"
seco="#8CAAEE"
pr_a="#E5C890"
se_a="#707880"

# Listen for updates of the tagstate
xprop -spy -root "DWM_TAG_STATE_$MONITOR" 2>/dev/null | {
    # Read the tag state
    while true; do
        IFS=$'\t' read -ra tags_string <<< "$(xprop -notype -root "DWM_TAG_STATE_$MONITOR")"
        {
            [[ $tags_string =~ \"(.*)\" ]]
            tags=${BASH_REMATCH[0]}
            # Print the state for each tag to polybar
            # Formatting Tags are used here according to polybar's wiki
            for i in {1..9}
            do
                case ${tags:$i:1} in
                    a)
                        # the tag is viewed on the focused monitor
                        echo "%{F$back}%{B$prim} ${i} %{F-}%{B-}"
                        ;;
                    o)
                        # : the tag is not empty
                        echo "%{F$prim}%{B$back} ${i} %{F-}%{B-}"
                        ;;
                    u)
                        # ! the tag contains an urgent window
                        echo "%{F$seco}%{B$back} ${i} %{F-}%{B-}"
                        ;;
                    *)
                        # . the tag is empty
                        echo "%{F$fore}%{B$back} ${i} %{F-}%{B-}"
                        ;;
                esac
            done
        } | tr -d "\n"

        echo
    read -r || break
done
}
