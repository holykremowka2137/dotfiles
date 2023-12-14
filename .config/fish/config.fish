#!/usr/bin/fish

set fish_greeting

set -gx VISUAL "emacsclient -c -a emacs "
set -gx EDITOR "emacsclient -t -a '' "
set -gx SUDO_EDITOR "/usr/bin/nvim"
set -gx TERM "alacritty"
set -gx TERMINAL "alacritty"

set -gx GTK_IM_MODULE "fcitx"
set -gx QT_IM_MODULE "fcitx"
set -gx XMODIFIERS "@im=fcitx"

set USB32 "/run/media/victoria/0012-D687/"
set USB16 "/run/media/victoria/3FAC-3165/"
set -x MANPAGER "emacsclient -c -a emacs +Man!"

function fish_user_key_bindings
  fish_vi_key_bindings
end

alias gc "cd ~/.config/"
alias gd "cd ~/Documents/"
alias gdo "cd ~/.gitfiles/dotfiles/"
alias geb "cd ~/Music/Eurobeat/"
alias gg "cd ~/.gitfiles/"
alias glp "cd ~/Music/Luzne_Piosenki/"
alias gm "cd ~/Music/"
alias gpi "cd ~/Pictures/"
alias gpr "cd ~/Projects/"
alias gv "cd ~/Videos/"
alias .. "cd .."
alias ... "cd ../.."
alias .2 "cd ../.."
alias .3 "cd ../../.."
alias .4 "cd ../../../.."

abbr v "nvim"
abbr valac "$VISUAL ~/.config/alacritty/alacritty.yml"
abbr vautostart "$VISUAL ~/.config/qtile/autostart.sh"
abbr vcol "$VISUAL ~/.config/qtile/colors.py"
abbr qconf "$VISUAL ~/.config/qtile/config.py"
abbr vfish "$VISUAL ~/.config/fish/config.fish"
abbr vlf "$VISUAL ~/.config/lf/lfrc"
abbr vrofi "$VISUAL ~/.config/rofi/config.rasi"
abbr vstar "starship config"

alias gadd "git add"
alias gadda "git add -A"
alias gclone "git clone"
alias gcommit "git commit -m"
alias glog "git log"
alias gmerge "git merge"
alias gpull "git pull"
alias gpush "git push"
alias grestore "git restore"
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
abbr pf "paru && sudo flatpak update"
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
# alias l. "eza -a | grep -E "^\.""

abbr rf "rm -rf"
alias cp "cp -i"
alias ln "ln -i"
alias mv "mv -i"
alias rm "rm -i"

alias lfeb "lf ~/Music/Eurobeat"
alias lflp "lf ~/Music/Luzne_Piosenki"
alias lfmsc "lf ~/Music"
 
alias tobash "sudo chsh -s /bin/bash $USER && echo 'Now log out.'"
alias tofish "sudo chsh -s /bin/fish $USER && echo 'Now log out.'"

alias cpu "sudo auto-cpufreq --stats"
alias grep "grep --color=always"

alias ytm "yt-dlp -f "bestaudio/best" --embed-thumbnail --add-metadata --extract-audio --audio-format best"
alias ytv "yt-dlp -f "bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best""

abbr systemctl "sudo systemctl"
abbr efish "exec fish"

starship init fish | source
