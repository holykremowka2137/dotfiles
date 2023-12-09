#!/usr/bin/fish

set fish_greeting

### EXPORT ###
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

### SET VI MODE ###
function fish_user_key_bindings
  fish_vi_key_bindings
end

### ABBR & ALIASES ###
# nvim
abbr alaconf "nvim ~/.config/alacritty/alacritty.yml"
abbr autostart "nvim ~/.config/qtile/autostart.sh"
abbr fishconf "nvim ~/.config/fish/config.fish"
abbr qconf "nvim ~/.config/qtile/config.py"
abbr roficonf "nvim ~/.config/rofi/config.rasi"
abbr v "nvim"
abbr passwords "nvim ~/Documents/passwords.txt"
abbr starconf "nvim ~/.config/starship.toml"
abbr lfrc "nvim ~/.config/lf/lfrc"

# cd
alias .. "cd .."
alias .2 "cd ../.."
alias ... "cd ../.."
alias .3 "cd ../../.."
alias .... "cd ../../.."
alias .4 "cd ../../../.."
alias ..... "cd ../../../.."

# git
alias gadd "git add"
alias gaddA "git add -A"
alias gcommit "git commit -m"
alias gpush "git push"
alias gpull "git pull"
alias gmerge "git merge"
alias gstatus "git status"
alias glog "git log"

# mirrors
alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# mpv
alias eb "mpv --no-video --term-osd-bar --shuffle ~/Music/Eurobeat"
alias lp "mpv --no-video --term-osd-bar --shuffle ~/Music/Luzne_Piosenki"
alias music "mpv --no-video --term-osd-bar --shuffle"
alias msc "mpv --no-video --term-osd-bar --shuffle ~/Music"

# paru
abbr p "paru"
abbr rns "paru -Rns"
abbr s "paru -S"
abbr pos "paru && sudo flatpak update"

alias cpu "sudo auto-cpufreq --stats"
alias grep "grep --color=auto"
alias ls "ls --color=auto"
alias rmv "rm -Rf"

# cargo
alias crun "cargo run"
alias cbuild "cargo build"
alias cnew "cargo new"
alias ccheck "cargo check"

# lf
alias lfeb "lf ~/Music/Eurobeat"
alias lflp "lf ~/Music/Luzne_Piosenki"
alias lfmsc "lf ~/Music"

# yt-dlp
alias ytm "yt-dlp -f "bestaudio/best" --embed-thumbnail --add-metadata --extract-audio --audio-format best"
alias ytv "yt-dlp -f "bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best""

starship init fish | source
