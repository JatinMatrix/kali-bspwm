#!/bin/bash

# Configuración para DisplayPort-0 (monitor izquierdo)
xrandr --output DisplayPort-0 --mode 1360x768 --pos 0x0 --rate 60

# Configuración para HDMI-A-0 (monitor principal derecho)
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 165 --pos 1360x0

# Configuración alternativa si prefieres forzar 1920x1080 en ambos:
# 1. Primero verifica si el modo ya existe
if ! xrandr | grep -q "1920x1080_60.00"; then
    xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode DisplayPort-0 "1920x1080_60.00"
fi

# 2. Aplica la configuración
xrandr --output DisplayPort-0 --mode "1920x1080_60.00" --pos 0x0 \
    --output HDMI-A-0 --primary --mode 1920x1080 --rate 165 --pos 1920x0
