#!/usr/bin/env fish

sudo pacman -Syyu

function which_cpu
    echo
    echo (set_color -oi green)"What CPU do you have? AMD or intel? [(A)md/(I)ntel]" 
    read choice
    switch $choice
    case amd
        sudo pacman -S amd-ucode
        echo (set_color normal)(set_color -o green)"Done!"
    case a
        sudo pacman -S amd-ucode
        echo (set_color normal)(set_color -o green)"Done!"
    case intel
        sudo pacman -S intel-ucode
        echo (set_color normal)(set_color -o green)"Done!"
    case i
        sudo pacman -S intel-ucode
        echo (set_color normal)(set_color -o green)"Done!"
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        which_cpu
    end
end

function xvswl
    echo 
    echo (set_color -oi green)"Do you want X11 or Wayland? [x/w]"
    read choice
    switch $choice
    case x
        sudo pacman -S xorg xorg-xinit xclip picom redshift xdotool flameshot 
        echo (set_color normal)(set_color -o green)"Done!"
    case w
        sudo pacman -S wayland wlroots pywlroots python-pywayland python-xkbcommon xorg-xwayland wl-clipboard gammastep ydotool xdg-desktop-portal-wlr grim slurp
        echo
        echo (set_color normal)(set_color -o green)"Done!"
    case '*'
        echo
        echo (set_color -oi green)"Are you sure about that?"
        xvswl
    end
end

function packages
    echo
    echo (set_color -oi green)"Installing fonts..."
    sudo pacman -S ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols-common noto-fonts-extra noto-fonts-emoji noto-fonts-cjk 
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Installing apps..."
    sudo pacman -S vivaldi thunderbird krita ristretto libreoffice-still okular xed steam deluge-gtk psensor alacritty kitty gparted file-roller file-roller fcitx-im fcitx-mozc fcitx-configtool lxappearance rofi rofi-emoji networkmanager hunspell-en_US bluez bluez-utils signal-desktop totem obs-studio kvantum
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Installing command-line apps..."
    sudo pacman -S neovim yt-dlp python-pycryptodome mpv python-pip python-pygame man-db sagemath ufw ffmpeg brotli python-mutagen python-pyxattr fish p7zip unrar tar rsync neofetch uwufetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 curl wget reflector plocate unzip zip dunst cmatrix cython python-jupymake eza
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Installing pipewire..."
    sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber helvum easyeffects calf yelp pipewire-alsa alsa-utils lib32-pipewire pipewire-audio lib32-pipewire-jack
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Finished!"
end

function file_manager
    echo 
    echo (set_color -oi green)"What GUI file manager do you want?"
    echo (set_color normal)(set_color blue)"Thunar [1]"
    echo (set_color blue)"Nemo [2]"
    echo (set_color blue)"Yazi [3]"
    echo (set_color blue)"All of 'em [4]"
    echo (set_color -o yellow)"Your choice: " 
    read choice
    switch $choice
    case 1
        echo (set_color -oi green)"Installing Thunar..."
        sudo pacman -S thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer
        echo (set_color normal)(set_color -o green)"Done!"
    case 2
        echo (set_color -oi green)"Installing Nemo..."
        sudo pacman -S nemo cinnamon-translations nemo-image-converter nemo-preview
        echo (set_color normal)(set_color -o green)"Done!"
    case 3
        echo (set_color -oi green)"Installing Yazi"
        sudo pacman -S yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
        echo (set_color normal)(set_color -o green)"Done!"
    case 4
        echo (set_color -oi green)"Installing all of them..."
        sudo pacman -S thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer nemo cinnamon-translations nemo-image-converter nemo-preview yazi unarchiver jq poppler fd ripgrep fzf zoxide
        echo (set_color normal)(set_color -o green)"Done!"
    case '*'
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        file_manager
    end
end

function Neovim
    echo
    echo (set_color -oi green)"Do you want to install based Nvim configuration? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S --needed neovim fd ripgrep npm 
        git clone https://www.github.com/holykremowka2137/init.lua.git ~/.config/nvim && nvim
        ln -s .local/state/nvim/swap/ ~/nvim-swap
        echo (set_color -oi green)"Configuration installed!"
        echo (set_color -oi green)"All official packages installed."
    case n
        echo (set_color normal)(set_color -o green)"Skipping."
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        Neovim
    end
end

function doomemacs
    echo
    echo (set_color -oi green)"Do you want to install Doom Emacs? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S --needed emacs-nativecomp fd ripgrep npm 
        git clone https://www.github.com/hlissner/doom-emacs ~/.emacs.d
        ~/.emacs.d/bin/doom install
        echo (set_color -oi green)"Doom Emacs installed!"
        echo (set_color -oi green)"All official packages installed."
    case n
        echo (set_color normal)(set_color -o green)"Skipping."
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        doomemacs
    end
end

function dotfiles
    echo 
    echo (set_color -oi green)"Do you want to download your dotfiles from GitHub? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S stow
        git clone https://www.github.com/holykremowka2137/dotfiles.git ~/Repos/dotfiles/
        stow -v --target="$HOME"/.config/ ~/Repos/dotfiles/.config/.
        mkdir ~/.local/bin/
        stow -v --target="$HOME"/.local/bin/ ~/Repos/dotfiles/.local/bin/.
        echo (set_color -oi green)"Dotfiles are done."
    case n
        echo (set_color normal)(set_color -o green)"Skipping."
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        dotfiles
    end
end

function install_paru
    echo
    echo (set_color -oi green)"Do you want paru on this machine? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S --needed base-devel git
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        echo (set_color -oi green)"Paru built."
        install_aur
    case n
        echo (set_color normal)(set_color -o green)"Skipping."
    case '*'
        echo
        echo (set_color -oi green)"Are you sure about that?"
        install_paru
    end
end

function install_aur
    echo
    echo (set_color -oi green)"Do you want to install software from AUR? [y/n]"
    echo (set_color normal)(set_color -o blue)"(software in question: catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin kvantum-theme-catppuccin-git)"
    read choice
    switch $choice
    case y
        paru -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin kvantum-theme-catppuccin-git
        sudo auto-cpufreq --install
        echo (set_color -oi green)"AUR packages built."
    case n
      echo (set_color -oi green)"skipping"
    case '*'
        echo
        echo (set_color -oi green)"Are you sure about that?"
        install_aur
    end
end

function install_flatpak
    echo 
    echo (set_color -oi green)"Do you want to install Flatpak? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S flatpak flatpak-xdg-utils
        echo (set_color -oi green)"Flatpak installed."
    case n
        echo (set_color normal)(set_color -o green)"Skipping."
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        install_flatpak
    end
end

function DM
    echo
    echo (set_color -oi green)"Choose the DM you want from the below list: " (set_color normal)
    echo (set_color blue)"Ly-DM [1]"
    echo (set_color blue)"SDDM [2]"
    echo (set_color blue)"LightDM [3]"
    echo (set_color blue)"Nothing [4]"
    echo (set_color -o yellow)"Your choice: " 
    read choice
    switch $choice
    case 1
        echo (set_color -oi green)"Installing Ly and uninstalling LightDM..."
        sudo pacman -S ly && sudo pacman -Rns lightdm
        echo (set_color normal)(set_color -o green)"Done!"
        echo (set_color -oi green)"Enabling Ly..."
        sudo systemctl enable ly
        echo (set_color normal)(set_color -o green)"Done!"
    case 2
        echo (set_color -oi green)"Installing SDDM and uninstalling LightDM..."
        #sudo pacman -S sddm && sudo pacman -Rns lightdm
        echo (set_color normal)(set_color -o green)"Done!"
        echo (set_color -oi green)"Enabling SDDM..."
        #sudo systemctl enable sddm
        echo (set_color normal)(set_color -o green)"Done!"
    case 3
        echo (set_color -oi green)"Enabling LightDM..."
        sudo systemctl enable lightdm
        echo (set_color normal)(set_color -o green)"Done!"
    case 4
        echo (set_color -oi green)"Uninstalling LightDM..."
        sudo pacman -Rns lightdm
        echo (set_color -o green)"Done! Enjoy your bloat-free system!"
    case '*'
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        DM
    end
end

function enabling
    echo
    echo (set_color -oi green)"Enabling Bluetooth..."
    sudo systemctl enable bluetooth
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Enabling 'locate' & adding user to groups..."
    sudo updatedb
    sudo usermod -aG locate,wheel,video,tty,dbus,input "$USER"
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Enabling autostart.sh..."
    chmod +x ~/.config/qtile/autostart.sh
    echo (set_color normal)(set_color -o green)"Done!"

    echo (set_color -oi green)"Changing colors of Papirus Icon Theme..."(set_color normal)
    papirus-folders -C cat-mocha-pink --theme Papirus-Dark
    echo (set_color normal)(set_color -o green)"Done!"
end

function rebooting
    echo
    echo (set_color -oi green)"Do you want to reboot? [y/n]"
    read choice
    switch $choice
    case y
        reboot
    case n
        echo (set_color -oi green)"Finished script! Well done!"
        echo
    case '*' 
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        rebooting
    end
end

which_cpu
xvswl
packages
file_manager
Neovim
doomemacs
dotfiles
install_paru
install_flatpak
DM
enabling
rebooting
