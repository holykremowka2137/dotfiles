function fish_default_mode_prompt
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                set_color -o red
                echo ' E'
            case insert
                set_color -o green
                echo ' I'
            case replace_one
                set_color -o 89dceb
                echo ' R'
            case replace
                set_color -o 89dceb
                echo ' R'
            case visual
                set_color -o blue
                echo ' V'
        end
        set_color normal
    end
end
