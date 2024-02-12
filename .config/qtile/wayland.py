from libqtile import hook
from libqtile.backend.wayland.inputs import InputConfig
from libqtile.config import Key
from libqtile.lazy import lazy

import subprocess

mod = "mod4"
terminal = "foot"
keys_backend = []

keys_backend.extend(
    [
        Key([mod, "control"], "F1", lazy.core.change_vt(1)),
        Key([mod, "control"], "F2", lazy.core.change_vt(2)),
        Key([mod, "control"], "F3", lazy.core.change_vt(3)),
        Key([mod, "control"], "F4", lazy.core.change_vt(4)),
        Key([mod, "control"], "F5", lazy.core.change_vt(5)),
        Key([mod, "control"], "F6", lazy.core.change_vt(6)),
        Key([mod, "control"], "F7", lazy.core.change_vt(7)),
    ]
)

wl_input_rules = {
    "type:keyboard": InputConfig(kb_options="caps:escape_shifted_capslock,altwin:swap_alt_win"),
}

@hook.subscribe.startup_once
def autostart():
    subprocess.run("/home/victoria/.config/qtile/autostart.sh")
