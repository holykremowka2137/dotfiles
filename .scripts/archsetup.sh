#! /bin/bash

sudo pacman -Syyu

packages () {
    echo
    echo "Installing fonts..."
    echo
    sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-extra noto-fonts-emoji noto-fonts-cjk 
    echo
    echo "Fonts installed!"
    echo  "Installing apps..."
    echo
    sudo pacman -S vivaldi thunderbird krita ristretto libreoffice-still okular xed steam deluge-gtk lightdm-gtk-greeter-settings psensor alacritty kitty gparted ark fcitx-im fcitx-mozc fcitx-configtool lxappearance rofi rofi-emoji nemo cinnamon-translations nemo-image-converter nemo-preview networkmanager hunspell-en_US bluez bluez-utils signal-desktop totem
    echo
    echo "Apps installed!"
    echo "Installing command-line apps..."
    echo
    sudo pacman -S neovim yt-dlp mpv python-pip python-pygame man-db sagemath ufw ffmpeg brotli python-mutagen python-pyxattr fish p7zip unrar tar rsync neofetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 curl wget lf starship alsa-utils reflector plocate unzip zip dunst cmatrix cython python-jupymake
    echo
    echo "Command-line apps installed!"
    echo "Finished!"
}

xvswl() {
    echo 
    read -p "Do you want X11 or Wayland? [x/w]: " xvswl
    if [ "$xvswl" == "x" ]; then
        sudo pacman -S xorg xorg-xinit xclip picom redshift xdotool 
        echo "Xorg installed!"
    elif [ "$xvswl" == "w" ]; then
        sudo pacman -S wayland wlroots pywlroots python-pywayland python-xkbcommon xorg-xwayland wl-clipboard gammastep ydotool
        echo "Wayland installed! This is the future!"
    else
        echo "Are you sure?"
        xvswl
    fi
}

which_cpu() {
    echo
    read -p "What CPU do you have? AMD or intel? [(A)md/(I)ntel]: " cpu
    if [ "$cpu" == "amd" ] ||  [ "$cpu" == "a" ]; then
        sudo pacman -S amd-ucode
        echo "AMD drivers installed!"
    elif [ "$cpu" == "intel" ] || [ "$cpu" == "i" ]; then
        sudo pacman -S intel-ucode
        echo "Intel drivers installed!"
    else
        echo "Are you sure?"
        which_cpu
    fi
}

# install aur packages
install_paru() {
    echo
    read -p "Do you want paru on this machine? [y/n]: " paru
    if [ "$paru" == "y" ]; then
        sudo pacman -S --needed base-devel git
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        echo "Paru built."
        install_aur
    elif [ "$paru" == "n" ]; then
        echo "Skipping."
    else
        echo "Are you sure?"
        install_paru
    fi
}

dotfiles() {
    echo 
    read -p "Do you want to download your dotfiles from GitHub? [y/n]: " dtfls
    if [ "$dtfls" == "y" ]; then
        sudo pacman -S stow
        git clone https://github.com/holykremowka2137/dotfiles.git ~/.gitfiles/dotfiles/ --depth 1
        cd ~/.gitfiles/dotfiles/.config/
        stow -v --target=${HOME}/.config/ .
        mkdir ~/.scripts/
        cd ~/.gitfiles/dotfiles/.scripts/
        stow -v --target=${HOME}/.scripts/ .
        echo "Dotfiles are done."
    elif [ "$dtfls" == "n" ]; then
        echo "Skipping."
    else 
        echo "Are you sure?"
        dotfiles
    fi
}

install_flatpak() {
    echo 
    read -p "Do you want to install Flatpak? [y/n]: " fltpk
    if [ "$fltpk" == "y" ]; then
        sudo pacman -S flatpak flatpak-xdg-utils
        echo "Flatpak installed."
    elif [ "$fltpk" == "n" ]; then
        echo "Skipping."
    else 
        echo "Are you sure?"
        install_flatpak
    fi
}

install_nvchad() {
    echo
    read -p "Do you want to install NvChad? [y/n]: " nvim
    if [ "$nvim" == "y" ]; then
        sudo pacman -S --needed nvim fd ripgrep npm 
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
        ln -s .local/state/nvim/swap/ ~/nvim-swap
        echo "NvChad installed!"
        echo "All official packages installed."
    elif [ "$nvim" == "n" ]; then
        echo "Skipping."
        echo "All official packages installed."
    else 
        echo "Are you sure?"
        install_nvchad
    fi
}

install_aur() {
  echo
  echo "Do you want to install software from AUR? [y/n]: "
  read -p "(software in question: catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin) " aur
  if [ "$aur" == "y" ]; then
    paru -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin      
    sudo auto-cpufreq --install
    echo "AUR packages built."
  elif [ "$aur" == "n" ]; then
    echo "skipping"
  else 
    echo "Are you sure?"
    install_aur
  fi
}

enabling () {
    echo "Enabling LightDM..."
    sudo systemctl enable lightdm
    echo "LightDM enabled!"
    echo "Enabling Bluetooh..."
    sudo systemctl enable bluetooth
    echo "Bluetooch enabled!"
    echo "Enabling `locate` & adding user to groups..."
    sudo updatedb
    sudo usermod -aG locate,wheel,video,tty,dbus $USER
    echo "`locate` & adding user to groups finished!"
    echo "Remapping caps lock..."
    setxkbmap -option "caps:escape_shifted_capslock"
    sudo localectl set-x11-keymap us '' '' caps:escape_shifted_capslock
    echo "Finished remapping caps lock!"
    echo "Exporting variables..."
    export SUDO_EDITOR
    export EDITOR
    export VISUAL
    echo "Finished exporting variables!"
    echo "Enabling autostart.sh..."
    chmod +x ~/.scripts/autostart.sh
    echo "Finished enabling autostart.sh!"
}

rebooting() {
    echo
    read -p "Do you want to reboot? [y/n]: " reboot
    if [ "$reboot" == "y" ]; then
        reboot
    elif [ "$reboot" == "n" ]; then
        echo "Finished!"
        echo
    else 
        echo "Are you sure?"
        rebooting
    fi
}

which_cpu
xvswl
packages
install_nvchad
dotfiles
install_paru
install_aur
install_flatpak
enabling
rebooting
