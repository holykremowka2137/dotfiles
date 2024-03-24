#!/usr/bin/env fish

set -gx VISUAL "foot -e nvim"
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx TERM foot
set -gx TERMINAL foot

set USB32 /run/media/victoria/0012-D687/
set USB16 /run/media/victoria/3FAC-3165/

set -g __fish_git_prompt_color -o red
set -g __fish_git_prompt_showuntrackedfiles false
set -g _fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_showdirtystate true
set -g __fish_git_prompt_showupstream informative

alias gc "cd ~/.config/"
alias gcf "cd ~/.config/fish/"
alias gcn "cd ~/.config/nvim/"
alias gcq "cd ~/.config/qtile/"
alias gd "cd ~/Documents/"
alias grd "cd ~/Repos/dotfiles/"
alias grdlb "cd ~/Repos/dotfiles/.local/bin/"
alias grdc "cd ~/Repos/dotfiles/.config/"
alias gme "cd ~/Music/Eurobeat/"
alias gr "cd ~/Repos/"
alias glb "cd ~/.local/bin/"
alias gml "cd ~/Music/Luzne_Piosenki/"
alias gm "cd ~/Music/"
alias gp "cd ~/Pictures/"
alias gps "cd ~/Pictures/Screenshots/"
alias gpr "cd ~/Projects/"
alias gprr "cd ~/Projects/Rust/"
alias gv "cd ~/Videos/"
alias .. "cd .."
alias ... "cd ../.."
alias .2 "cd ../.."
alias .3 "cd ../../.."
alias .4 "cd ../../../.."

alias gadd "git add"
alias gadd. "git add ."
alias gbranch "git branch"
alias gclone "git clone"
alias gcommit "git commit -m"
alias gdiff "git diff"
alias glog "git log"
alias gmerge "git merge"
alias gpull "git pull"
alias gpush "git push"
alias grestore "git restore"
alias gstatus "git status"

abbr v nvim
abbr v. "nvim ."
abbr valac "nvim ~/.config/alacritty/alacritty.toml"
abbr vbash "nvim ~/.bashrc"
abbr vfish "nvim ~/.config/fish/config.fish"
abbr vfoot "nvim ~/.config/foot/foot.ini"
abbr vkitty "nvim ~/.config/kitty/kitty.conf"
abbr vlf "nvim ~/.config/lf/lfrc"
abbr vqtile "nvim ~/.config/qtile/config.py"
abbr vrofi "nvim ~/.config/rofi/config.rasi"
abbr vstar "nvim ~/.config/starship.toml"
abbr vsway "nvim ~/.config/sway/config"
abbr vv "nvim ~/.config/nvim/"
abbr vyazi "nvim ~/.config/yazi/"
alias emacs "emacsclient -nc -a emacs"
# fuck u, leather man

alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"

alias eb "mpv --no-video --term-osd-bar --shuffle ~/Music/Eurobeat"
alias lp "mpv --no-video --term-osd-bar --shuffle ~/Music/Luzne_Piosenki"
alias msc "mpv --no-video --term-osd-bar --shuffle"

abbr p paru
abbr pos "paru && sudo flatpak update"
abbr rns "paru -Rns"
abbr s "paru -S"

alias cbuild "cargo build"
alias ccheck "cargo check"
alias cnew "cargo new"
alias crun "cargo run"

alias ls "eza -al --color=always --group-directories-first"
alias la "eza -a --color=always --group-directories-first"
alias ll "eza -l --color=always --group-directories-first"
alias lt "eza -aT --color=always --group-directories-first"
alias lt. "lt | grep"
alias ls. "ls | grep"

#alias rf "mv -t ~/.local/share/Trash/files/"
abbr rf "rm -rf"
alias cp "cp -ri"
alias ln "ln -i"
alias mv "mv -i"
alias rm "rm -i"
alias mkdir "mkdir -pv"

alias thunareb "thunar ~/Music/Eurobeat"
alias thunarlp "thunar ~/Music/Luzne_Piosenki"
alias thunarmsc "thunar ~/Music"

alias eblf "lf ~/Music/Eurobeat"
alias lplf "lf ~/Music/Luzne_Piosenki"
alias msclf "lf ~/Music"

alias yazieb "yazi ~/Music/Eurobeat"
alias yazilp "yazi ~/Music/Luzne_Piosenki"
alias yazimsc "yazi ~/Music"
alias yaeb "yazi ~/Music/Eurobeat"
alias yalp "yazi ~/Music/Luzne_Piosenki"
alias yamsc "yazi ~/Music"

alias cpu "sudo auto-cpufreq --stats"
alias grep "grep -i --color=always"

alias ytm "yt-dlp -f \"bestaudio/best\" --embed-thumbnail --add-metadata --extract-audio --audio-format best"
alias ytv "yt-dlp -f \"bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best\" --embed-thumbnail --add-metadata --embed-chapters"

abbr efish "exec fish"
abbr ebash "exec bash"
abbr updb "sudo updatedb"
abbr pq "python ~/.config/qtile/config.py"
alias alias. "alias | grep"

alias q "dbus-run-session qtile start -b wayland"
abbr ff fastfetch

source ~/Repos/dotfiles/.local/bin/startup.fish
