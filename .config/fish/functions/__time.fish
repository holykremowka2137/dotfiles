function __time
    if test $CMD_DURATION
        set -g duration (echo "$CMD_DURATION 1000" | awk '{printf "%.0fs", $1 / $2}')
        if test $duration = "1s" || test $duration = "0s"
            echo "" 
        else
            set_color -o yellow
            echo " $duration"
        end
    end
end
