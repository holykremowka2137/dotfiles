#! /bin/bash

sudo pacman -Syu
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-extra noto-fonts-emoji noto-fonts-cjk vivaldi neovim yt-dlp mpv python-pip python-pygame p7zip man-db htop sagemath ufw neofetch ffmpeg brotli python-mutagen python-pyxattr fish p7zip unrar tar rsync neofetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 curl wget lf starship thunderbird krita ristretto libreoffice-still okular xed steam deluge-gtk lightdm-gtk-greeter-settings psensor alacritty kitty gparted ark fcitx-im fcitx-mozc fcitx-configtool lxappearance rofi rofi-emoji nemo cinnamon-translations nemo-image-converter nemo-preview networkmanager hunspell-en_US alsa-utils reflector plocate bluez bluez-utils signal-desktop unzip zip dunst cmatrix cython python-jupymake 

echo "Finished!"

xvswl() {
  echo 
  read -p "Do you want X11 or Wayland? [x/w]: " xvswl
  if [ "$xvswl" == "x" ]; then
    sudo pacman -S xorg xorg-xinit xclip picom redshift 
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
    git clone https://github.com/holykremowka2137/dotfiles.git ~/.git/dotfiles/ --depth 1
    cd ~/.git/dotfiles/.config/
    stow --target=${HOME}/.config/ .
    cd ~/.git/dotfiles/.scripts/
    stow --target=${HOME}/.scripts/ .
    echo "Dotfiles are done."
  elif [ "$dtfls" == "n" ]; then
    echo "Skipping."
  else 
    echo "Are you sure?"
    dotfiles
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
}

install_nvchad() {
  echo
  read -p "Do you want to install NvChad? [y/n]: " nvim
  if [ "$nvim" == "y" ]; then
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    sudo pacman -S --needed nvim fd ripgrep npm 
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
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
  read -p "(software in question: catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq) " aur
  if [ "$aur" == "y" ]; then
    paru -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq       
    sudo auto-cpufreq --install
    echo "AUR packages built."
  elif [ "$aur" == "n" ]; then
    echo "skipping"
  else 
    echo "Are you sure?"
    install_aur
  fi
}

# enabling what is to enable
sudo systemctl enable lightdm
sudo systemctl enable bluetooth

# configuration
# if [ "$machine" == "pc" ] || [ "$machine" == "PC" ]; then
#     rsync -av --progress files/desktop/.local ~/.
#     rsync -av --progress files/desktop/.config ~/.
# elif [ "$machine" == "laptop" ]; then
#     rsync -av --progress files/laptop/.local ~/.
#     rsync -av --progress files/laptop/.config ~/.
# fi

# rebooting
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

xvswl
which_cpu
install_paru
dotfiles
install_flatpak
install_nvchad
install_aur
rebooting
