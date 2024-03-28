#!/usr/bin/env fish

gammastep & disown
import-gsettings
dunst & disown

# eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown

$TERM -e $EDITOR ~/Desktop/notes.txt & disown
