#!/usr/bin/env fish

gammastep & 
import-gsettings
dunst &

$TERM -e $EDITOR ~/Desktop/notes.txt &
