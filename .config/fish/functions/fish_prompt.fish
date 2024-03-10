function fish_prompt
    echo -ns \
    (set_color cba6f7) \
    (prompt_pwd) \
    (fish_git_prompt) \
    (__time) \
    (fish_default_mode_prompt) \
    (set_color normal) \
    \ 
end
