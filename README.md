# What's this
Nothing much, just a bunch of my config files and scripts. In the future i will possibly add more here, e.g. my $HOME config files (.xinitrc, .bashrc etc. .etc.).

# Installation
Just paste this link in your shell (ofc change where u want this directory, I just copied this from my archsetup.sh script).
```shell
git clone https://github.com/holykremowka2137/dotfiles.git ~/.gitfiles/dotfiles/ 
```

U can also use `stow` to quickly paste them where u want. It's really useful and overall, it saves a lot of hassle.
```shell
cd ~/.gitfiles/dotfiles/.config/
stow -v --target=$HOME/.config/ .
mkdir ~/.local/bin
cd ~/.gitfiles/dotfiles/.local/bin
stow -v --target=$HOME/.local/bin/ .
```

If u want to run Qtile off my config, then remember to make `autostart` script executable.
```shell
chmod +x ~/.local/bin/autostart
```

# Credits
My archsetup.sh is a fork of [banku's](https://github.com/bankubanku) setup.sh. I also based this README off of his own. Go check him out.

# Contribution
If u want to add your 2 cents here, then feel free to make an issue or pr, but also, please remember that this repo are my dotfiles, not anything else.
