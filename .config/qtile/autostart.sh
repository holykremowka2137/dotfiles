#!/usr/bin/env fish

gammastep & 
import-gsettings
dunst &

$TERM -e nvim ~/Desktop/notes.txt &
