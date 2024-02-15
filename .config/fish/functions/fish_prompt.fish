function fish_prompt
    echo -n -s (set_color -o red) \[ (set_color yellow) "$USER" (set_color green) \@ (set_color blue) $hostname \  (set_color cba6f7) (prompt_pwd) (set_color red) \] (set_color normal) \$\  
end
