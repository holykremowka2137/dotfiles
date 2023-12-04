#!/usr/bin/fish

set fish_greeting

### ABBR ###
abbr alaconf 'nvim ~/.config/alacritty/alacritty.yml'
abbr autostart 'nvim ~/.config/qtile/autostart.sh'
abbr fishconf 'nvim ~/.config/fish/config.fish'
abbr qconf 'nvim ~/.config/qtile/config.py'
abbr rns 'paru -Rns'
abbr roficonf 'nvim ~/.config/rofi/config.rasi'
abbr s 'paru -S'
abbr v nvim

### ALIASES ###
alias cpu 'sudo auto-cpufreq --stats'
alias eb 'mpv --no-video --term-osd-bar --shuffle ~/Music/Eurobeat'
alias ebthunar 'thunar ~/Music/Eurobeat'
alias grep 'grep --color=auto'
alias lp 'mpv --no-video --term-osd-bar --shuffle ~/Music/Luzne_Piosenki'
alias lpthunar 'thunar ~/Music/Luzne_Piosenki'
alias ls 'ls --color=auto'
alias mirrors 'sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias music 'mpv --no-video --term-osd-bar'
alias passwords 'nvim ~/Documents/passwords.txt'
alias pos 'paru && sudo flatpak update'
alias rmv 'rm -Rf'
alias ytmusic 'yt-dlp -f "bestaudio/best" --embed-thumbnail --add-metadata --extract-audio --audio-format best'
alias ytvid 'yt-dlp -f "bestvideo[ext=mp3]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

starship init fish | source
