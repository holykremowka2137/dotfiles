#!/usr/bin/fish

set fish_greeting

set VISUAL "/usr/bin/nvim"
set EDITOR "/usr/bin/nvim"
set SUDO_EDITOR "/usr/bin/nvim"
set TERM "alacritty"
set TERMINAL "alacritty"

set GTK_IM_MODULE "fcitx"
set QT_IM_MODULE "fcitx"
set XMODIFIERS "@im=fcitx"

set USB32 "/run/media/victoria/0012-D687/"
set USB16 "/run/media/victoria/3FAC-3165/"
set -x MANPAGER "nvim +Man!"

function fish_user_key_bindings
  fish_vi_key_bindings
end

abbr passwords "nvim ~/Documents/passwords.txt"
abbr v "nvim"
abbr valac "nvim ~/.config/alacritty/alacritty.yml"
abbr vautostart "nvim ~/.config/qtile/autostart.sh"
abbr vcol "nvim ~/.config/qtile/colors.py"
abbr qconf "nvim ~/.config/qtile/config.py"
abbr vfish "nvim ~/.config/fish/config.fish"
abbr vlf "nvim ~/.config/lf/lfrc"
abbr vrofi "nvim ~/.config/rofi/config.rasi"
abbr vstar "nvim ~/.config/starship.toml"

abbr gd "cd ~/Documents/"
abbr gm "cd ~/Music/"
abbr glp "cd ~/Music/Luzne_Piosenki/"
abbr geb "cd ~/Music/Eurobeat/"
abbr gpi "cd ~/Pictures/"
abbr gpr "cd ~/Projects/"
abbr gv "cd ~/Videos/"
abbr gc "cd ~/.config/"
abbr gg "cd ~/.gitfiles/"
abbr gdo "cd ~/.gitfiles/dotfiles/"

alias .. "cd .."
alias .2 "cd ../.."
alias ... "cd ../.."
alias .3 "cd ../../.."
alias .... "cd ../../.."
alias .4 "cd ../../../.."
alias ..... "cd ../../../.."

alias gadd "git add"
alias gadda "git add -A"
alias gclone "git clone"
alias gcommit "git commit -m"
alias glog "git log"
alias gmerge "git merge"
alias gpull "git pull"
alias gpush "git push"
alias gstatus "git status"

alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"

alias eb "mpv --no-video --term-osd-bar --shuffle ~/Music/Eurobeat"
alias lp "mpv --no-video --term-osd-bar --shuffle ~/Music/Luzne_Piosenki"
alias msc "mpv --no-video --term-osd-bar --shuffle ~/Music"
alias music "mpv --no-video --term-osd-bar --shuffle"

abbr p "paru"
abbr pos "paru && sudo flatpak update"
abbr rns "paru -Rns"
abbr s "paru -S"

alias cpu "sudo auto-cpufreq --stats"
alias grep "grep --color=auto"
alias ls "ls -lah --color=auto"
alias rmv "rm -Rf"

alias cbuild "cargo build"
alias ccheck "cargo check"
alias cnew "cargo new"
alias crun "cargo run"

alias ls "eza -al --color=always --group-directories-first"
alias la "eza -a --color=always --group-directories-first"
alias ll "eza -l --color=always --group-directories-first"
alias lt "eza -aT --color=always --group-directories-first"
alias l. "eza -a | grep -E "^\.""

alias lfeb "lf ~/Music/Eurobeat"
alias lflp "lf ~/Music/Luzne_Piosenki"
alias lfmsc "lf ~/Music"

alias ytm "yt-dlp -f "bestaudio/best" --embed-thumbnail --add-metadata --extract-audio --audio-format best"
alias ytv "yt-dlp -f "bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best""

starship init fish | source
