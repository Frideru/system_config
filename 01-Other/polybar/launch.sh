#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar -q main -c ~/.config/polybar/config.ini & 
polybar -q secondary -c ~/.config/polybar/config.ini & 
echo "Polybar launched..."

#Практика по скоропечатанию может быть хорошим инструментом для сбора
#инофрмации о людях, а точнее о их скорости и стиле письма что может
#хорошо сказаться в дальнейшем при поимке хакеров или приступников.
