# What's this
Nothing much, just a bunch of my config files and scripts. In the future i will possibly add more here, e.g. my $HOME config files (.xinitrc, .bashrc etc. .etc.).

# Installation
Just paste this link in your shell (you can of course customize where you want to have this).
```shell
git clone https://github.com/holykremowka2137/dotfiles.git ~/Repos/dotfiles/ --depth 1
```

U can also use `stow` to quickly paste them where u want. It's really useful and overall, it saves a lot of hassle.
```shell
cd ~/Repos/dotfiles/.config/
stow -v --target=$HOME/.config/ .
mkdir ~/.local/bin
cd ~/Repos/dotfiles/.local/bin
stow -v --target=$HOME/.local/bin/ .
```

If u want to run Qtile off my config, then remember to make `autostart.sh` script executable.
```shell
chmod +x ~/.config/qtile/autostart.sh
```

# Credits
My archsetup.sh is a fork of [banku's](https://github.com/bankubanku) setup.sh. I also based this README off of his own. Go check him out.

I also copied/stolen a lot of stuff from other Linux youtubers, e.g. DistroTube or Eric Murphy.

# Contribution
If u want to add your 2 cents here, then feel free to make an issue or pr, but also, please remember that this repo are my dotfiles, not anything else.
