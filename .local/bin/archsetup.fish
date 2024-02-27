#!/usr/bin/env fish

sudo pacman -Syyu

function which_cpu
    echo
    echo (set_color -oi green)"Which CPU do you have?" 
    set_color normal
    echo (set_color green)"1. AMD"
    echo (set_color green)"2. Intel"
    echo (set_color -o yellow)"Your choice:" 
    read choice
    switch $choice
    case 1
        sudo pacman -S --noconfirm amd-ucode
    case 2
        sudo pacman -S --noconfirm intel-ucode
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        which_cpu
    end
end

function xvswl
    echo 
    echo (set_color -oi green)"Do you want X11 or Wayland?"
    set_color normal
    echo (set_color green)"1. X11"
    echo (set_color green)"2. Wayland"
    echo (set_color -o yellow)"Your choice:" 
    read choice
    switch $choice
    case 1
        sudo pacman -S --noconfirm xorg xorg-xinit xclip picom redshift xdotool flameshot 
    case 2
        sudo pacman -S --noconfirm wayland wlroots pywlroots python-pywayland python-xkbcommon xorg-xwayland wl-clipboard gammastep ydotool xdg-desktop-portal-wlr grim slurp
        echo
    case '*'
        echo
        echo (set_color -oi green)"Are you sure about that?"
        xvswl
    end
end

function packages
    echo
    echo (set_color -oi green)"Installing fonts..."
    set_color normal
    sudo pacman -S --noconfirm ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols-common noto-fonts-extra noto-fonts-emoji noto-fonts-cjk 

    echo (set_color -oi green)"Installing apps..."
    set_color normal
    sudo pacman -S --noconfirm vivaldi thunderbird krita ristretto libreoffice-still xed steam deluge-gtk psensor gparted file-roller file-roller fcitx-im fcitx-mozc fcitx-configtool lxappearance rofi rofi-emoji networkmanager hunspell-en_US bluez bluez-utils totem obs-studio kvantum

    echo (set_color -oi green)"Installing command-line apps..."
    set_color normal
    sudo pacman -S --noconfirm neovim yt-dlp python-pycryptodome mpv python-pip python-pygame man-db sagemath ufw ffmpeg brotli python-mutagen python-pyxattr fish p7zip unrar tar rsync neofetch uwufetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 curl wget reflector plocate unzip zip dunst cmatrix cython python-jupymake eza

    # deep, dark fantasy

    echo (set_color -oi green)"Installing pipewire..."
    set_color normal
    sudo pacman -S --noconfirm pipewire pipewire-pulse pipewire-jack wireplumber helvum easyeffects calf yelp pipewire-alsa alsa-utils lib32-pipewire pipewire-audio lib32-pipewire-jack

    echo (set_color -oi green)"Finished!"
end

function file_manager
    echo 
    echo (set_color -oi green)"Which GUI file manager do you want?"
    set_color normal
    echo (set_color green)"1. Thunar"
    echo (set_color green)"2. Nemo"
    echo (set_color green)"3. Yazi"
    echo (set_color green)"4. All of 'em"
    echo (set_color -o yellow)"Your choice: " 
    read choice
    switch $choice
    case 1
        echo (set_color -oi green)"Installing Thunar..."
        set_color normal
        sudo pacman -S --noconfirm thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer
    case 2
        echo (set_color -oi green)"Installing Nemo..."
        set_color normal
        sudo pacman -S --noconfirm nemo cinnamon-translations nemo-image-converter nemo-preview
    case 3
        echo (set_color -oi green)"Installing Yazi"
        set_color normal
        sudo pacman -S --noconfirm yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
    case 4
        echo (set_color -oi green)"Installing all of them..."
        set_color normal
        sudo pacman -S --noconfirm thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer
        sudo pacman -S --noconfirm nemo cinnamon-translations nemo-image-converter nemo-preview
        sudo pacman -S --noconfirm yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
    case '*'
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        file_manager
    end
end

function terminals
    echo 
    echo (set_color -oi green)"Which terminal emulator do you want?"
    set_color normal
    echo (set_color green)"1. Foot"
    echo (set_color green)"2. Alacritty"
    echo (set_color green)"3. Kitty"
    echo (set_color green)"4. All of 'em"
    echo (set_color -o yellow)"Your choice: " 
    read choice
    switch $choice
    case 1
        echo (set_color -oi green)"Installing Foot..."
        set_color normal
        sudo pacman -S --noconfirm foot
    case 2
        echo (set_color -oi green)"Installing Alacritty..."
        set_color normal
        sudo pacman -S --noconfirm alacritty
    case 3
        echo (set_color -oi green)"Installing Kitty..."
        set_color normal
        sudo pacman -S --noconfirm kitty
    case 4
        echo (set_color -oi green)"Installing all of them..."
        set_color normal
        sudo pacman -S --noconfirm alacritty kitty foot
    case '*'
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        terminals
    end
end

function Neovim
    echo
    echo (set_color -oi green)"Do you want to install based Nvim configuration? [y/n]"
    read choice
    switch $choice
    case y
        sudo pacman -S --noconfirm --needed neovim fd ripgrep npm 
        git clone https://www.github.com/holykremowka2137/init.lua.git ~/.config/nvim && nvim
        ln -s .local/state/nvim/swap/ ~/nvim-swap
        echo (set_color -oi green)"Configuration installed!"
        echo (set_color -oi green)"All official packages installed."
        set_color normal
    case n
        echo (set_color -o green)"Skipping."
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
        sudo pacman -S --noconfirm --needed emacs-nativecomp fd ripgrep npm 
        git clone https://www.github.com/hlissner/doom-emacs ~/.emacs.d
        ~/.emacs.d/bin/doom install
        echo (set_color -oi green)"Doom Emacs installed!"
        echo (set_color -oi green)"All official packages installed."
        set_color normal
    case n
        echo (set_color -o green)"Skipping."
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
        sudo pacman -S --noconfirm stow
        git clone https://www.github.com/holykremowka2137/dotfiles.git ~/Repos/dotfiles/
        stow -v --target="$HOME"/.config/ ~/Repos/dotfiles/.config/.
        mkdir ~/.local/bin/
        stow -v --target="$HOME"/.local/bin/ ~/Repos/dotfiles/.local/bin/.
        echo (set_color -oi green)"Dotfiles are done."
        set_color normal
    case n
        echo (set_color -o green)"Skipping."
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
        sudo pacman -S --noconfirm --needed base-devel git
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        echo (set_color -oi green)"Paru built."
        set_color normal
        install_aur
    case n
        echo (set_color -o green)"Skipping."
    case '*'
        echo
        echo (set_color -oi green)"Are you sure about that?"
        install_paru
    end
end

function install_aur
    echo
    echo (set_color -oi green)"Do you want to install software from AUR? [y/n]"
    set_color normal
    echo (set_color -o green)"(software in question: catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin kvantum-theme-catppuccin-git)"
    read choice
    switch $choice
    case y
        paru -S --noconfirm catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin kvantum-theme-catppuccin-git
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
        sudo pacman -S --noconfirm flatpak flatpak-xdg-utils
        echo (set_color -oi green)"Flatpak installed."
        set_color normal
    case n
        echo (set_color -o green)"Skipping."
    case '*' 
        echo
        echo (set_color -oi green)"Are you sure about that?"
        install_flatpak
    end
end

function DM
    echo
    echo (set_color -oi green)"Choose the DM you want from the below list:" 
    set_color normal
    echo (set_color green)"1. Ly-DM"
    echo (set_color green)"2. SDDM"
    echo (set_color green)"3. LightDM"
    echo (set_color green)"4. Nothing"
    echo (set_color -o yellow)"Your choice: " 
    read choice
    switch $choice
    case 1
        echo (set_color -oi green)"Installing Ly and uninstalling LightDM..."
        set_color normal
        sudo pacman -S --noconfirm ly && sudo pacman -Rns --noconfirm lightdm
        echo (set_color -oi green)"Enabling Ly..."
        set_color normal
        sudo systemctl enable ly
    case 2
        echo (set_color -oi green)"Installing SDDM and uninstalling LightDM..."
        set_color normal
        sudo pacman -S --noconfirm sddm && sudo pacman -Rns --noconfirm lightdm
        echo (set_color -oi green)"Enabling SDDM..."
        set_color normal
        sudo systemctl enable sddm
    case 3
        echo (set_color -oi green)"Enabling LightDM..."
        set_color normal
        sudo systemctl enable lightdm
    case 4
        echo (set_color -oi green)"Uninstalling LightDM..."
        set_color normal
        sudo pacman -Rns --noconfirm lightdm
    case '*'
        echo 
        echo (set_color -oi green)"Are you sure about that?"
        DM
    end
end

function enabling
    echo
    echo (set_color -oi green)"Enabling Bluetooth..."
    set_color normal
    sudo systemctl enable bluetooth

    echo (set_color -oi green)"Enabling 'locate' & adding user to groups..."
    set_color normal
    sudo updatedb
    sudo usermod -aG locate,wheel,video,tty,dbus,input "$USER"

    echo (set_color -oi green)"Enabling autostart.sh..."
    set_color normal
    chmod +x ~/.config/qtile/autostart.sh

    echo (set_color -oi green)"Changing colors of Papirus Icon Theme..."
    set_color normal
    papirus-folders -C cat-mocha-green --theme Papirus-Dark
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
terminals
Neovim
doomemacs
dotfiles
install_paru
install_flatpak
DM
enabling
rebooting
