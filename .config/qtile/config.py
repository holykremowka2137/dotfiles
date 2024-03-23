from libqtile import hook, bar, layout, widget, qtile  # , extension
from libqtile.backend.wayland.inputs import InputConfig
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration
from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule

import subprocess
import os

mod = "mod4"
terminal = "foot"
editor = terminal + " -e nvim"
browser = "librewolf"
file_manager = "thunar"
home = os.path.expanduser("~")


@lazy.layout.function
def change_gaps(layout, step):
    if not hasattr(layout, "margin"):
        return
    if not isinstance(layout.margin, int):
        return

    layout.margin = max(layout.margin + step, 0)
    layout.group.layout_all()


@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


keys = [
    # not layout specific
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "space", lazy.group.next_window()),
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left().when(layout=["columns", "monadtall"]),
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right().when(layout=["columns", "monadtall"]),
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down().when(layout=["columns", "monadtall"]),
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up().when(layout=["columns", "monadtall"]),
    ),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),
    Key([mod], "Tab", lazy.next_layout()),
    Key(
        [mod],
        "n",
        lazy.layout.reset().when(layout="monadtall"),
        lazy.layout.normalize().when(layout="columns"),
    ),
    Key(
        [mod],
        "bracketleft",
        lazy.layout.grow().when(layout="monadtall"),
        lazy.layout.swap_column_left().when(layout="columns"),
    ),
    Key(
        [mod],
        "bracketright",
        lazy.layout.shrink().when(layout="monadtall"),
        lazy.layout.swap_column_right().when(layout="columns"),
    ),
    Key([mod], "q", lazy.window.kill()),
    # columns
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod], "grave", lazy.layout.toggle_split()),
    # monadtall
    Key([mod, "shift"], "n", lazy.layout.normalize().when(layout="monadtall")),
    Key([mod], "o", lazy.layout.maximize().when(layout="monadtall")),
    Key([mod, "shift"], "space", lazy.layout.flip().when(layout="monadtall")),
    # functions
    Key([mod], "equal", change_gaps(5)),
    Key([mod], "minus", change_gaps(-5)),
    Key([mod, "shift"], "m", minimize_all()),
    # apps shortcuts
    Key([mod], "Return", lazy.spawn(terminal)),
    KeyChord(
        [mod],
        "a",
        [
            Key([], "e", lazy.spawn(file_manager)),
            Key([], "b", lazy.spawn(browser)),
            # Key([], "v", lazy.spawn("emacsclient -c -a 'emacs' ")),
            Key([], "v", lazy.spawn(editor)),
            Key([], "d", lazy.spawn("discord")),
            Key(["shift"], "d", lazy.spawn("killall Discord", shell=True)),
            Key([], "s", lazy.spawn("steam")),
            Key(["shift"], "s", lazy.spawn("killall steam", shell=True)),
        ],
        name="LAUNCHING APPS",
    ),
    # menu
    KeyChord(
        [mod],
        "w",
        [
            Key([], "w", lazy.spawn("rofi -show drun")),
            Key([], "e", lazy.spawn("rofi -show emoji")),
        ],
        name="MENU",
    ),
    # Key(
    #     [mod, "control"],
    #     "Delete",
    #     lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"),
    # ),
    # brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 2%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 2%-")),
    # volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse set Master toggle")),
    # screenshots
    Key(["Shift"], "Print", lazy.spawn("scrnsht select", shell=True)),
    Key([], "Print", lazy.spawn("scrnsht", shell=True)),
    # reloading config
    Key([mod, "control"], "r", lazy.reload_config()),
    # shuting computer down
    Key([mod, "control"], "Delete", lazy.spawn("shutdown -h now")),
]

for vt in range(1, 8):
    keys.append(
        Key(
            [mod, "control"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
        )
    )

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([mod], "Button1", lazy.window.bring_to_front()),
]

wl_input_rules = {
    "type:keyboard": InputConfig(
        kb_layout="us",
        kb_options="caps:escape_shifted_capslock,altwin:swap_alt_win",
    ),
}

# groups = [
#    Group("1", label="一", layout="monadtall"),
#    Group("2", label="ニ", layout="max", matches=[Match(wm_class="LibreWolf")]),
#    Group("3", label="三", layout="monadtall"),
#    Group("4", label="四", layout="monadtall"),
#    Group("5", label="五", layout="max", matches=[Match(wm_class="discord")]),
#    Group("6", label="六", layout="monadtall"),
#    Group("7", label="七", layout="monadtall"),
#    Group("8", label="八", layout="monadtall"),
#    Group("9", label="九", layout="monadtall"),
#    Group("0", label="零", layout="monadtall"),
# ]

groups = [
    Group("1", label="一", layout="columns"),
    Group("2", label="ニ", layout="max", matches=[Match(wm_class="LibreWolf")]),
    Group("3", label="三", layout="columns"),
    Group("4", label="四", layout="columns"),
    Group("5", label="五", layout="max", matches=[Match(wm_class="discord")]),
    Group("6", label="六", layout="columns"),
    Group("7", label="七", layout="columns"),
    Group("8", label="八", layout="columns"),
    Group("9", label="九", layout="columns"),
    Group("0", label="零", layout="columns"),
]

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
            Key([mod, "control"], i.name, lazy.window.togroup(i.name)),
            Key([mod], "comma", lazy.screen.prev_group()),
            Key([mod], "period", lazy.screen.next_group()),
        ]
    )

ROSEWATER = "#f5e0dc"
FLAMINGO = "#f2cdcd"
PINK = "#f5c2e7"
MAUVE = "#cba6f7"
RED = "#f38ba8"
MAROON = "#eba0ac"
PEACH = "#fab387"
YELLOW = "#f9e2af"
GREEN = "#a6e3a1"
TEAL = "#94e2d5"
SKY = "#89dceb"
SAPPHIRE = "#74c7ec"
BLUE = "#89b4fa"
LAVENDER = "#b4befe"
TEXT = "#cdd6f4"
SUBTEXT1 = "#bac2de"
SUBTEXT0 = "#a6adc8"
OVERLAY2 = "#9399b2"
OVERLAY1 = "#7f849c"
OVERLAY0 = "#6c7086"
SURFACE2 = "#585b70"
SURFACE1 = "#45475a"
SURFACE0 = "#313244"
BASE = "#1e1e2e"
MANTLE = "#181825"
CRUST = "#11111b"

layout_theme = dict(
    border_width=2,
    margin=0,
    border_focus=GREEN,
    border_normal=CRUST,
)

layouts = [
    layout.Columns(
        border_focus_stack=RED,
        border_normal_stack=OVERLAY2,
        border_on_single=False,
        fair=True,
        grow_amount=5,
        insert_position=1,
        **layout_theme,
    ),
    # pants? wrestling?
    layout.Max(),
    layout.MonadTall(**layout_theme),
]

bs = PowerLineDecoration(path="back_slash")
fs = PowerLineDecoration(path="forward_slash")
rl = PowerLineDecoration(path="rounded_left")
rr = PowerLineDecoration(path="rounded_right")

bs = {"decorations": [bs]}
fs = {"decorations": [fs]}
rl = {"decorations": [rl]}
rr = {"decorations": [rr]}

bar_clr = BASE
# bar_clr = "#00000000"

widget_defaults = dict(
    background=BASE,
    font="Noto Sans Medium",
    fontsize=16,
    foreground=BASE,
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper=home + "/.config/qtile/wallpapers/albedo-wallpaper3.png",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.TextBox(fmt=" "),
                widget.GroupBox2(
                    disable_drag=True,
                    fontsize=22,
                    hide_unused=False,
                    padding_x=3,
                    rules=[
                        GroupBoxRule(block_colour=OVERLAY0).when(
                            screen=ScreenRule.THIS, occupied=True
                        ),
                        GroupBoxRule(block_colour=OVERLAY0, text_colour=TEXT).when(
                            screen=ScreenRule.THIS, occupied=False
                        ),
                        GroupBoxRule(block_colour=GREEN).when(screen=ScreenRule.OTHER),
                        GroupBoxRule(text_colour=GREEN).when(occupied=True),
                        GroupBoxRule(text_colour=OVERLAY0).when(occupied=False),
                    ],
                    **bs,
                ),
                widget.WindowCount(
                    background=GREEN,
                    font="Noto Sans Bold",
                    fontsize=22,
                    show_zero=True,
                    **rl,
                ),
                widget.Spacer(background=bar_clr, length=10, **rr),
                widget.Chord(
                    background=SKY,
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    **rl,
                ),
                widget.Spacer(background=bar_clr, **rr),
                widget.Clock(background=TEXT, format="󰃭 %a, %d.%m.%Y 󰥔 %H:%M", **rl),
                widget.Spacer(background=bar_clr),
                widget.StatusNotifier(
                    background=bar_clr,
                    padding=6,
                ),
                widget.Spacer(background=bar_clr, length=10, **rr),
                widget.WindowName(
                    background=ROSEWATER,
                    empty_group_string="  ",
                    format="{name}",
                    scroll=True,
                    scroll_delay=1,
                    scroll_fixed_width=False,
                    scroll_step=3,
                    width=200,
                    **fs,
                ),
                widget.Volume(background=PINK, fmt=" {}", **fs),
                widget.Backlight(
                    background=MAUVE,
                    backlight_name="intel_backlight",
                    brightness_file="brightness",
                    fmt=" {}",
                    **fs,
                ),
                widget.ThermalSensor(
                    background=RED, fmt="󰈸 {}", tag_sensor="Core 0", **fs
                ),
                widget.Battery(
                    background=PEACH,
                    charge_char="󰂉 ",
                    discharge_char="󰁾 ",
                    empty_char="󰁺 ",
                    format="{char}{percent:2.0%}",
                    full_char="󰁹 ",
                    show_short_text=False,
                    unknown_char="󱈸󱈸 ",
                    update_interval=1,
                    **fs,
                ),
                widget.CurrentLayout(background=TEAL, fmt="{} "),
            ],
            34,
            background=bar_clr,
            # border_color=bar_clr,
            # border_width=[2, 2, 2, 2],
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="mpv"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    subprocess.run(home + "/.local/bin/autostart.fish")
