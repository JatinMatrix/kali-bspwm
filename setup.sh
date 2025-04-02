#!/bin/bash

# Nombre: mi-automatizacion-bspwm
# Autor: ReyserLyn (@reyserlyn)
# Descripción: Instalación automatizada de bspwm con config personalizada
# Versión: 1.0
# Basado en: https://github.com/r1vs3c/auto-bspwm

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Global variables
dir=$(pwd)
fontdir="$HOME/.local/share/fonts"
user=$(whoami)

trap ctrl_c INT

function ctrl_c() {
  echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
  exit 1
}

function banner() {
  echo -e "\n${turquoiseColour}██╗  ██╗ █████╗ ██╗     ██╗    ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗"
  sleep 0.05
  echo -e "██║ ██╔╝██╔══██╗██║     ██║    ██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║"
  sleep 0.05
  echo -e "█████╔╝ ███████║██║     ██║    ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║"
  sleep 0.05
  echo -e "██╔═██╗ ██╔══██║██║     ██║    ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║"
  sleep 0.05
  echo -e "██║  ██╗██║  ██║███████╗██║    ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║"
  sleep 0.05
  echo -e "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝    ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝${endColour}"
  sleep 0.05
  echo -e "\n"
  sleep 0.05
  echo -e "${purpleColour}Automated BSPWM Environment${endColour}"
  sleep 0.05
  echo -e "${grayColour}By ${endColour}${purpleColour}@reyserlyn${endColour}"
  sleep 0.05
  echo -e "${turquoiseColour}Kali Linux Edition${endColour}"
  sleep 0.05
  echo -e "${grayColour}v1.0${endColour}"
  sleep 0.05
  echo -e "\n"
}

if [ "$user" == "root" ]; then
  banner
  echo -e "\n\n${redColour}[!] You should not run the script as the root user!\n${endColour}"
  exit 1
else
  banner
  sleep 1
fi
