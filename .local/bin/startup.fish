#!/usr/bin/env fish

if status -i
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        function startup
            echo
            read -p prompt1 choice
            switch $choice
                case y
                    paru
                    _reboot
                case n
                    start_qtile
                case '*'
                    paru
                    _reboot
            end
        end

        function _reboot
            echo
            read -p prompt2 choice
            switch $choice
                case y
                    reboot
                case n
                    start_qtile
                case '*'
                    start_qtile
            end
        end

        function start_qtile
            echo
            read -p prompt3 choice
            switch $choice
                case y
                    dbus-run-session qtile start -b wayland
                case n
                    return
                case '*'
                    dbus-run-session qtile start -b wayland
            end
        end

        function prompt1
            echo -ns (set_color brwhite) \
                "Update? [Y/n] " \
                (set_color normal)
        end

        function prompt2
            echo -ns (set_color brwhite) \
                "Reboot? [y/N] " \
                (set_color normal)
        end

        function prompt3
            echo -ns (set_color brwhite) \
                "Qtile? [Y/n] " \
                (set_color normal)
        end

        startup
    end
end
