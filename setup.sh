#!/bin/bash

# Nombre: kali-bspwm
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
fontDir="$HOME/.local/share/fonts"
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

  # ---- Install necessary packages ----
  echo -e "\n\n${blueColour}[*] Installing necessary packages for the environment...\n${endColour}"
  sleep 2
  sudo apt install -y curl wget xinput fonts-crosextra-carlito fastfetch htop kitty rofi feh xclip ranger thunar btop i3lock-fancy scrot scrub golang wmname imagemagick cmatrix python3-pip python3 procps tty-clock fzf lsd bat pamixer flameshot bpytop clang cargo
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n\n${redColour}[!] Failed to install some packages!\n${endColour}"
    exit 1
  else
    echo -e "\n\n${greenColour}[+] Successfully installed necessary packages!\n${endColour}"
    sleep 1.5
  fi

  # ---- Install necessary dependencies ----
  echo -e "\n${blueColour}[*] Starting installation of necessary dependencies for the environment...\n${endColour}"
  sleep 0.5

  # ---- Install necessary dependencies for bspwm ----
  echo -e "\n${purpleColour}[*] Installing necessary dependencies for bspwm...\n${endColour}"
  sleep 2
  sudo apt install -y build-essential git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libuv1-dev
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install some dependencies for bspwm!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install necessary dependencies for polybar ----
  echo -e "\n${purpleColour}[*] Installing necessary dependencies for polybar...\n${endColour}"
  sleep 2
  sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install some dependencies for polybar!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install necessary dependencies for picom ----
  echo -e "\n${purpleColour}[*] Installing necessary dependencies for picom...\n${endColour}"
  sleep 2
  sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install some dependencies for picom!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install necessary tools ----
  echo -e "\n${blueColour}[*] Starting installation of the tools...\n${endColour}"
  sleep 0.5
  mkdir ~/tools && cd ~/tools

  # ---- Install brave ----
  echo -e "\n${purpleColour}[*] Installing brave...\n${endColour}"
  sleep 2
  curl -fsS https://dl.brave.com/install.sh | sh
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install brave!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install caido Desktop ----
  echo -e "\n${purpleColour}[*] Installing caido Desktop...\n${endColour}"
  sleep 2
  wget https://caido.download/releases/v0.47.1/caido-desktop-v0.47.1-linux-x86_64.deb
  sudo dpkg -i caido-desktop-v0.47.1-linux-x86_64.deb
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install caido Desktop!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install Windsurf ----
  echo -e "\n${purpleColour}[*] Installing Windsurf...\n${endColour}"
  sleep 2
  curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list >/dev/null
  sudo apt-get update
  sudo apt-get upgrade windsurf
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install Windsurf!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install Obsidian ----
  echo -e "\n${purpleColour}[*] Installing Obsidian...\n${endColour}"
  sleep 2
  wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.9/obsidian_1.8.9_amd64.deb
  sudo dpkg -i obsidian_1.8.9_amd64.deb
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install Obsidian!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install OnlyOffice ----
  echo -e "\n${purpleColour}[*] Installing OnlyOffice...\n${endColour}"
  sleep 2
  wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
  sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install OnlyOffice!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install bspwm ----
  echo -e "\n${purpleColour}[*] Installing bspwm...\n${endColour}"
  sleep 2
  git clone https://github.com/baskerville/bspwm.git
  cd bspwm
  make -j$(nproc)
  sudo make install
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install bspwm!\n${endColour}"
    exit 1
  else
    sudo apt install bspwm -y
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi
  cd ..

  # ---- Install sxhkd ----
  echo -e "\n${purpleColour}[*] Installing sxhkd...\n${endColour}"
  sleep 2
  git clone https://github.com/baskerville/sxhkd.git
  cd sxhkd
  make -j$(nproc)
  sudo make install
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install sxhkd!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi
  cd ..

  # ---- Install polybar ----
  echo -e "\n${purpleColour}[*] Installing polybar...\n${endColour}"
  sleep 2
  git clone --recursive https://github.com/polybar/polybar
  cd polybar
  mkdir build
  cd build
  cmake ..
  make -j$(nproc)
  sudo make install
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install polybar!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi
  cd ../../

  # ---- Install picom ----
  echo -e "\n${purpleColour}[*] Installing picom...\n${endColour}"
  sleep 2
  git clone https://github.com/ibhagwan/picom.git
  cd picom
  git submodule update --init --recursive
  meson --buildtype=release . build
  ninja -C build
  sudo ninja -C build install
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install picom!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi
  cd ..

  # ---- Install necessary nvim----
  echo -e "\n${purpleColour}[*] Installing neovim...\n${endColour}"
  sleep 2
  wget https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
  sudo tar -xzvf nvim-linux-x86_64.tar.gz -C /opt/
  sudo rm -f nvim-linux-x86_64.tar.gz
  sudo mv -f /opt/nvim-linux-x86_64 /opt/nvim
  sudo rm -f /usr/local/bin/nvim
  sudo ln -sfv /opt/nvim/bin/nvim /usr/local/bin/nvim
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install neovim!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install Grub2-themes ----
  echo -e "\n${purpleColour}[*] Installing Grub2-themes...\n${endColour}"
  sleep 2
  git clone https://github.com/vinceliuice/grub2-themes.git
  cd grub2-themes
  ./install.sh
  cd ..
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install Grub2-themes!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install Oh My Zsh and Powerlevel10k ----
  echo -e "\n${purpleColour}[*] Installing Oh My Zsh and Powerlevel10k for user $user...\n${endColour}"
  sleep 2
  sudo rm -rfd ~/powerlevel10k
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install Oh My Zsh and Powerlevel10k for user $user!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Install Oh My Zsh and Powerlevel10k for root ----
  echo -e "\n${purpleColour}[*] Installing Oh My Zsh and Powerlevel10k for user root...\n${endColour}"
  sleep 2
  sudo rm -rfd /root/powerlevel10k
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install Oh My Zsh and Powerlevel10k for user root!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Configure zsh-sudo ----
  echo -e "\n${purpleColour}[*] Configuring zsh-sudo...\n${endColour}"
  sleep 2
  sudo mkdir /usr/share/zsh-sudo/
  sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh -O /usr/share/zsh-sudo/zsh-sudo.zsh
  sudo chmod +x /usr/share/zsh-sudo/zsh-sudo.zsh
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure fonts, wallpaper, configuration files, .zshrc, .p10k.zsh, and scripts ----
  echo -e "\n${blueColour}[*] Starting configuration of fonts, wallpaper, configuration files, .zshrc, .p10k.zsh, and scripts...\n${endColour}"
  sleep 0.5

  # ---- Configure fonts ----
  echo -e "\n${purpleColour}[*] Configuring fonts...\n${endColour}"
  sleep 2
  if [[ -d "$fontDir" ]]; then
    cp -rv $dir/fonts/* $fontDir
  else
    mkdir -p $fontDir
    cp -rv $dir/fonts/* $fontDir
  fi
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure wallpaper ----
  echo -e "\n${purpleColour}[*] Configuring wallpaper...\n${endColour}"
  sleep 2
  if [[ -d "~/Wallpapers" ]]; then
    cp -rv $dir/wallpapers/* ~/Wallpapers
  else
    mkdir ~/Wallpapers
    cp -rv $dir/wallpapers/* ~/Wallpapers
  fi
  wal -nqi ~/Wallpapers/archkali.png
  sudo wal -nqi ~/Wallpapers/archkali.png
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure configuration files ----
  echo -e "\n${purpleColour}[*] Configuring configuration files...\n${endColour}"
  sleep 2
  cp -rv $dir/config/* ~/.config/
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure .zshrc and .p10k.zsh ----
  echo -e "\n${purpleColour}[*] Configuring the .zshrc and .p10k.zsh files...\n${endColour}"
  sleep 2
  cp -v $dir/.zshrc ~/.zshrc
  sudo ln -sfv ~/.zshrc /root/.zshrc
  cp -v $dir/.p10k.zsh ~/.p10k.zsh
  sudo ln -sfv ~/.p10k.zsh /root/.p10k.zsh
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Install nodejs with fnm ----
  echo -e "\n${purpleColour}[*] Installing nodejs...\n${endColour}"
  sleep 2
  curl -o- https://fnm.vercel.app/install | bash
  ~/.local/share/fnm/fnm install 22
  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install nodejs!\n${endColour}"
    exit 1
  else
    echo -e "\n${greenColour}[+] Done\n${endColour}"
    sleep 1.5
  fi

  # ---- Configure monitor configuration ----
  echo -e "\n${purpleColour}[*] Configuring monitor configuration...\n${endColour}"
  sleep 2
  sudo cp -v $dir/monitor.conf /etc/X11/xorg.conf.d/
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure scripts ----
  echo -e "\n${purpleColour}[*] Configuring scripts...\n${endColour}"
  sleep 2
  sudo cp -v $dir/scripts/whichSystem.py /usr/local/bin/
  cp -rv $dir/scripts/*.sh ~/.config/polybar/shapes/scripts/
  touch ~/.config/polybar/shapes/scripts/target
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Configure permissions and symbolic links ----
  echo -e "\n${purpleColour}[*] Configuring necessary permissions and symbolic links...\n${endColour}"
  sleep 2
  chmod -R +x ~/.config/bspwm/
  chmod +x ~/.config/polybar/launch.sh
  chmod +x ~/.config/polybar/shapes/scripts/*
  chmod +x ~/.config/screenlayout/monitors.sh
  chmod +x ~/.config/picom/picom.conf
  sudo chmod +x /usr/local/bin/whichSystem.py
  sudo chmod +x /usr/local/share/zsh/site-functions/_bspc
  sudo chown root:root /usr/local/share/zsh/site-functions/_bspc
  sudo mkdir -p /root/.config/polybar/shapes/scripts/
  sudo touch /root/.config/polybar/shapes/scripts/target
  sudo ln -sfv ~/.config/polybar/shapes/scripts/target /root/.config/polybar/shapes/scripts/target
  cd ..
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Remove repository and tools directory ----
  echo -e "\n${purpleColour}[*] Removing repository and tools directory...\n${endColour}"
  sleep 2
  rm -rfv ~/tools
  rm -rfv $dir
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # --- Select color environment ----
  echo -e "\n${purpleColour}[*] Selecting color environment (indigo-dark)...\n${endColour}"
  sleep 2
  ~/.config/polybar/shapes/scripts/color-switch.sh
  echo -e "\n${greenColour}[+] Done\n${endColour}"
  sleep 1.5

  # ---- Finish ----
  echo -e "\n${greenColour}[+] Environment configured :D\n${endColour}"
  sleep 1.5

  # ---- Restart ----
  while true; do
    echo -en "\n${yellowColour}[?] It's necessary to restart the system. Do you want to restart the system now? ([y]/n) ${endColour}"
    read -r
    REPLY=${REPLY:-"y"}
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo -e "\n\n${greenColour}[+] Restarting the system...\n${endColor}"
      sleep 1
      sudo reboot
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      exit 0
    else
      echo -e "\n${redColour}[!] Invalid response, please try again\n${endColour}"
    fi
  done
fi
