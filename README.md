# Kali-BSPWM

Una configuración personalizada de BSPWM para Kali Linux, diseñada para mejorar la productividad y la estética del entorno de trabajo.

## 📋 Descripción

Kali-BSPWM es un script de instalación automatizada que configura mi entorno BSPWM personalizado para Kali Linux. Este proyecto está diseñado para proporcionar una experiencia de usuario mejorada bajo **dos monitores** con un gestor de ventanas minimalista pero potente, junto con una selección de herramientas y aplicaciones útiles para tareas de seguridad informática y desarrollo.

## ✨ Software

- **VM -> [bspwm](https://github.com/baskerville/bspwm)**: Gestor de ventanas minimalista y eficiente
- **Hotkeys -> [sxhkd](https://github.com/baskerville/sxhkd)**: Gestor de atajos de teclado
- **Locker -> [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)**: Bloqueador de pantalla
- **shell -> [zsh](https://www.zsh.org/)**: Shell con configuración mejorada y plugins útiles
- **shell Theme -> [powerlevel10k](https://github.com/romkatv/powerlevel10k)**: Tema para ZSH
- **shell Plugins -> [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)**: Plugins útiles para ZSH
- **Bars -> [polybar](https://github.com/polybar/polybar)**: Barra de estado personalizada con temas atractivos
- **Bars Theme -> [polybar-themes](https://github.com/adi1090x/polybar-themes)**: Temas para Polybar
- **Compositor -> [picom](https://github.com/yshui/picom)**: Compositor para efectos visuales y transparencias
- **File Manager -> [thunar](https://docs.xfce.org/xfce/thunar/start)**: Gestor de archivos
- **Fonts -> [iosevka](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka) and [hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) and fonts-crosextra-carlito**: Tipografía personalizada
- **Application Launcher -> [rofi](https://github.com/davatorium/rofi)**: Lanzador de aplicaciones elegante y personalizable
- **Browsers -> [firefox](https://www.mozilla.org/en-US/firefox/new/) and [brave](https://brave.com/)**
- **Terminal -> [kitty](https://sw.kovidgoyal.net/kitty/)**
- **Static Wallpaper -> [feh](https://github.com/derf/feh)**
- **Capturas de pantalla -> [flameshot](https://flameshot.org/)**
- **Herramientas preinstaladas**: 
  - [Caido Desktop](https://caido.io/)
  - [Windsurf IDE](https://codeium.com/windsurf)
  - [Obsidian](https://obsidian.md/)
  - [OnlyOffice](https://www.onlyoffice.com/)

## 🚀 Instalación

1. Instala los paquetes necesarios:
   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

2. Clona este repositorio:
   ```bash
   git clone https://github.com/ReyserLyn/kali-bspwm.git
   cd kali-bspwm
   ```

3. Ejecuta el script de instalación:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

4. Reinicia tu sistema después de la instalación. Una vez que haya reiniciado, debes seleccionar BSPWM en tu gestor de inicio de sesión.

⚠️ **Nota**: El script debe ejecutarse como usuario normal, no como root.

## ⌨️ Atajos de teclado

### Básicos
- <kbd>Super</kbd> + <kbd>Return</kbd>: Abrir terminal (Kitty)
- <kbd>Super</kbd> + <kbd>d</kbd>: Lanzador de aplicaciones (Rofi)
- <kbd>Super</kbd> + <kbd>Escape</kbd>: Recargar configuración de sxhkd
- <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>r</kbd>: Reiniciar BSPWM
- <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>q</kbd>: Salir de BSPWM
- <kbd>Super</kbd> + <kbd>w</kbd>: Cerrar ventana
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>w</kbd>: Matar ventana

### Gestión de ventanas
- <kbd>Super</kbd> + <kbd>{t,shift + t,s,f}</kbd>: Cambiar estado de ventana (mosaico, pseudo-mosaico, flotante, pantalla completa)
- <kbd>Super</kbd> + <kbd>{Left,Down,Up,Right}</kbd>: Enfocar ventana en la dirección indicada
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>{Left,Down,Up,Right}</kbd>: Mover ventana en la dirección indicada
- <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>{Left,Down,Up,Right}</kbd>: Redimensionar ventana

### Espacios de trabajo
- <kbd>Super</kbd> + <kbd>{1-8,0}</kbd>: Cambiar al espacio de trabajo indicado
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>{1-8,0}</kbd>: Mover ventana al espacio de trabajo indicado

### Aplicaciones
- <kbd>Super</kbd> + <kbd>e</kbd>: Abrir explorador de archivos (Thunar)
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>f</kbd>: Abrir Firefox
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>: Abrir Caido
- <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>l</kbd>: Bloquear pantalla

### Multimedia
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Up</kbd>: Subir volumen
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Down</kbd>: Bajar volumen
- <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>m</kbd>: Silenciar/Restaurar volumen
- <kbd>Print</kbd>: Captura de pantalla completa
- <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd>: Captura de pantalla selectiva

## 🛠️ Personalización

### Monitores
Este script está diseñado para dos monitores, por lo que si quieres modificarlo, debes editar los archivos:
```
~/.config/screenlayout/monitors.sh
/etc/X11/xorg.conf.d/10-monitor.conf
```

### Fondos de pantalla
Los fondos de pantalla se encuentran en el directorio `~/Wallpapers/`. Para cambiar el fondo, edita la línea correspondiente en `~/.config/bspwm/bspwmrc`.

### Temas
La configuración visual se puede personalizar editando los archivos en:
- Polybar: `~/.config/polybar/shapes/`
- Picom: `~/.config/picom/picom.conf`
- BSPWM: `~/.config/bspwm/bspwmrc`
- Kitty: `~/.config/kitty/`

## 📝 Notas

- Este proyecto está diseñado específicamente para mi configuración personal de Kali Linux.
- Se recomienda hacer una copia de seguridad de tus archivos de configuración antes de la instalación.
- Algunas herramientas pueden requerir configuración adicional según tus necesidades.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar este proyecto, no dudes en hacer un fork y enviar un pull request.

## 👏 Créditos
Este proyecto está basado en [auto-bspwm](https://github.com/r1vs3c/auto-bspwm) de [@r1vs3c](https://github.com/r1vs3c), modificado para adaptarse a mi configuración personal.  