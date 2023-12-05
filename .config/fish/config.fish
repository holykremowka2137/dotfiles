#!/usr/bin/fish

set fish_greeting

### ABBR & ALIASES ###
#nvim
abbr alaconf 'nvim ~/.config/alacritty/alacritty.yml'
abbr autostart 'nvim ~/.config/qtile/autostart.sh'
abbr fishconf 'nvim ~/.config/fish/config.fish'
abbr qconf 'nvim ~/.config/qtile/config.py'
abbr roficonf 'nvim ~/.config/rofi/config.rasi'
abbr v nvim
alias passwords 'nvim ~/Documents/passwords.txt'

#mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#cd
alias .. 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'

#mpv
alias eb 'mpv --no-video --term-osd-bar --shuffle ~/Music/Eurobeat'
alias lp 'mpv --no-video --term-osd-bar --shuffle ~/Music/Luzne_Piosenki'
alias music 'mpv --no-video --term-osd-bar --shuffle'

#paru
abbr rns 'paru -Rns'
abbr s 'paru -S'
alias pos 'paru && sudo flatpak update'

#yt-dlp
alias ytmusic 'yt-dlp -f "bestaudio/best" --embed-thumbnail --add-metadata --extract-audio --audio-format best'
alias ytvideo 'yt-dlp -f "bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

#lf
alias eblf 'lf ~/Music/Eurobeat'
alias lplf 'lf ~/Music/Luzne_Piosenki'

alias cpu 'sudo auto-cpufreq --stats'
alias grep 'grep --color=auto'
alias ls 'ls --color=auto'
alias rmv 'rm -Rf'

starship init fish | source
