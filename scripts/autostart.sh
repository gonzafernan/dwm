#!/bin/sh

# keyboard layout
setxkbmap -layout latam

# Establecer fondo y esquema de colores con wal (cache)
wal -R

# xcompmge permite transparencia en ventanas (alpha)
xcompmgr &

#Network Manager
nm-applet

