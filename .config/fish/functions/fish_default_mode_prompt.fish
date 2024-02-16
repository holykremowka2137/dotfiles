function fish_default_mode_prompt
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                set_color -o red
                echo '[ESCAPE]'
            case insert
                set_color -o green
                echo '[INSERT]'
            case replace_one
                set_color -o 89dceb
                echo '[REPLACE]'
            case replace
                set_color -o 89dceb
                echo '[REPLACE]'
            case visual
                set_color -o fab387
                echo '[VISUAL]'
        end
        set_color normal
    end
end
