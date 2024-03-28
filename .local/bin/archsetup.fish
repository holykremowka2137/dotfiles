#!/usr/bin/env fish

sudo pacman -Syyu

function prompt
    echo (set_color -o yellow)"Your choice: "(set_color normal)
end

function which_cpu
    echo
    echo (set_color -oi green)"Which CPU do you have?"
    set_color normal
    echo (set_color green)"1. AMD"
    echo (set_color green)"2. Intel"
    read -p prompt choice
    switch $choice
        case 1
            sudo pacman -S amd-ucode
        case 2
            sudo pacman -S intel-ucode
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
    read -p prompt choice
    switch $choice
        case 1
            sudo pacman -S xorg xorg-xinit xclip picom redshift xdotool flameshot
        case 2
            sudo pacman -S wayland wlroots pywlroots python-pywayland python-xkbcommon xorg-xwayland wl-clipboard gammastep ydotool xdg-desktop-portal-wlr grim slurp
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
    sudo pacman -S ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols-common noto-fonts-extra noto-fonts-emoji noto-fonts-cjk

    echo (set_color -oi green)"Installing apps..."
    set_color normal
    sudo pacman -S ristretto libreoffice-still xed steam deluge-gtk psensor gparted file-roller file-roller lxappearance rofi rofi-emoji networkmanager hunspell-en_US bluez bluez-utils totem obs-studio kvantum polkit-gnome

    echo (set_color -oi green)"Installing command-line apps..."
    set_color normal
    sudo pacman -S neovim yt-dlp python-pycryptodome mpv python-pip python-pygame man-db ufw ffmpeg brotli python-mutagen python-pyxattr fish p7zip unrar tar rsync neofetch uwufetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 curl wget reflector plocate unzip zip dunst cmatrix cython python-jupymake eza

    # deep, dark fantasy

    echo (set_color -oi green)"Installing pipewire..."
    set_color normal
    sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber helvum easyeffects calf yelp pipewire-alsa alsa-utils lib32-pipewire pipewire-audio lib32-pipewire-jack
end

function file_manager
    echo
    echo (set_color -oi green)"Which GUI file manager do you want?"
    set_color normal
    echo (set_color green)"1. Thunar"
    echo (set_color green)"2. Nemo"
    echo (set_color green)"3. Yazi"
    echo (set_color green)"4. All of 'em"
    read -p prompt choice
    switch $choice
        case 1
            echo (set_color -oi green)"Installing Thunar..."
            set_color normal
            sudo pacman -S thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer
        case 2
            echo (set_color -oi green)"Installing Nemo..."
            set_color normal
            sudo pacman -S nemo cinnamon-translations nemo-image-converter nemo-preview
        case 3
            echo (set_color -oi green)"Installing Yazi"
            set_color normal
            sudo pacman -S yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
        case 4
            echo (set_color -oi green)"Installing all of them..."
            set_color normal
            sudo pacman -S thunar catfish gvfs thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler gobject-introspection intltool gvfs-mtp ffmpegthumbnailer
            sudo pacman -S nemo cinnamon-translations nemo-image-converter nemo-preview
            sudo pacman -S yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
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
    read -p prompt choice
    switch $choice
        case 1
            echo (set_color -oi green)"Installing Foot..."
            set_color normal
            sudo pacman -S foot
        case 2
            echo (set_color -oi green)"Installing Alacritty..."
            set_color normal
            sudo pacman -S alacritty
        case 3
            echo (set_color -oi green)"Installing Kitty..."
            set_color normal
            sudo pacman -S kitty
        case 4
            echo (set_color -oi green)"Installing all of them..."
            set_color normal
            sudo pacman -S alacritty kitty foot
        case '*'
            echo
            echo (set_color -oi green)"Are you sure about that?"
            terminals
    end
end

function Neovim
    echo
    echo (set_color -oi green)"Do you want to install LazyVim Neovim configuration? [y/n]"
    read -p prompt choice
    switch $choice
        case y
            sudo pacman -S --needed neovim fd ripgrep npm
            git clone https://www.github.com/holykremowka2137/LazyVim.git ~/.config/nvim && nvim
            ln -s .local/state/nvim/swap/ ~/nvim-swap
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
    read -p prompt choice
    switch $choice
        case y
            sudo pacman -S --needed emacs-nativecomp fd ripgrep npm
            git clone https://www.github.com/hlissner/doom-emacs ~/.emacs.d
            ~/.emacs.d/bin/doom install
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
    read -p prompt choice
    switch $choice
        case y
            sudo pacman -S stow
            git clone https://www.github.com/holykremowka2137/dotfiles.git ~/Repos/dotfiles/
            cd ~/Repos/dotfiles/.config/
            stow -v --target="$HOME"/.config/ .
            mkdir ~/.local/bin/
            cd ~/Repos/dotfiles/.local/bin/
            stow -v --target="$HOME"/.local/bin/ .
            cd
        case n
            stowing
        case '*'
            echo
            echo (set_color -oi green)"Are you sure about that?"
            dotfiles
    end
end

function stowing
    echo
    echo (set_color -oi green)"Do you want to stow your dotfiles? [y/n]"
    read -p prompt choice
    switch $choice
        case y
            sudo pacman -S stow
            cd ~/Repos/dotfiles/.config/
            stow -v --target="$HOME"/.config/ .
            mkdir ~/.local/bin/
            cd ~/Repos/dotfiles/.local/bin/
            stow -v --target="$HOME"/.local/bin/ .
            cd
        case n
            echo (set_color -o green)"Skipping."
        case '*'
            echo
            echo (set_color -oi green)"Are you sure about that?"
            stow
    end
end

function install_paru
    echo
    echo (set_color -oi green)"Do you want paru on this machine? [y/n]"
    read -p prompt choice
    switch $choice
        case y
            echo
            echo (set_color -oi green)"Which version of Rust do you want?"
            set_color normal
            echo (set_color green)"1. rust"
            echo (set_color green)"2. rustup"
            read -p prompt choice2
            switch $choice2
                case 1
                    sudo pacman -S --needed base-devel git rust
                    git clone https://aur.archlinux.org/paru.git
                    cd paru
                    makepkg -si
                    install_aur
                case 2
                    sudo pacman -S --needed base-devel git rustup
                    git clone https://aur.archlinux.org/paru.git
                    cd paru
                    makepkg -si
                    install_aur
            end
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
    read -p prompt choice
    switch $choice
        case y
            paru -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha papirus-folders-catppuccin-git qtile-extras brillo auto-cpufreq librewolf-bin kvantum-theme-catppuccin-git
            sudo auto-cpufreq --install
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
    read -p prompt choice
    switch $choice
        case y
            sudo pacman -S flatpak flatpak-xdg-utils
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
    read -p prompt choice
    switch $choice
        case 1
            echo (set_color -oi green)"Installing Ly and uninstalling LightDM..."
            set_color normal
            sudo pacman -S ly && sudo pacman -Rns lightdm
            echo (set_color -oi green)"Enabling Ly..."
            set_color normal
            sudo systemctl enable ly
        case 2
            echo (set_color -oi green)"Installing SDDM and uninstalling LightDM..."
            set_color normal
            sudo pacman -S sddm && sudo pacman -Rns lightdm
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
            sudo pacman -Rns lightdm
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
    read -p prompt choice
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
