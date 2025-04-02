#!/bin/bash

# Nombre del monitor DisplayPort (ajusta según tu sistema)
DP_PORT="DisplayPort-1"

# Verificar si el monitor DisplayPort está conectado
if ! xrandr | grep -q "$DP_PORT connected"; then
    echo "Error: $DP_PORT no está conectado"
    exit 1
fi

# Crear y agregar modo 1920x1080@60Hz si no existe
if ! xrandr | grep -q "1920x1080_60.00"; then
    echo "Creando nuevo modo 1920x1080@60Hz..."
    MODELINE=$(cvt 1920 1080 60 | grep Modeline | cut -d' ' -f2-)
    xrandr --newmode "1920x1080_60.00" $MODELINE
    xrandr --addmode $DP_PORT "1920x1080_60.00"
fi

# Configurar monitor DisplayPort (izquierdo)
xrandr --output $DP_PORT --mode "1920x1080_60.00" --pos 0x0

# Configurar monitor HDMI (derecho) si está conectado
if xrandr | grep -q "HDMI-A-0 connected"; then
    xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 165 --pos 1920x0
else
    echo "HDMI-A-0 no conectado, configurando solo $DP_PORT"
fi

echo "Configuración aplicada correctamente:"
echo "- $DP_PORT: 1920x1080@60Hz (izquierdo)"
echo "- HDMI-A-0: 1920x1080@165Hz (derecho, primario)"
