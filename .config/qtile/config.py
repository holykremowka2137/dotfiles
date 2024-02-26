from libqtile import hook, bar, layout, widget#, CurrentLayoutIconqtile, extension
from libqtile.backend.wayland.inputs import InputConfig
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration, PowerLineDecoration
from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule

from functions import change_gaps, minimize_all

import subprocess

mod = "mod4"
terminal = "foot"
editor = terminal + " -e nvim"
browser = "librewolf"
file_manager = "thunar"

keys = [
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "space", lazy.group.next_window()),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left().when(layout=["columns", "monadtall"])),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right().when(layout=["columns", "monadtall"])),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down().when(layout=["columns", "monadtall"])),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up().when(layout=["columns", "monadtall"])),

    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),

    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod], "Return", lazy.layout.toggle_split()),
    Key([mod], "n", lazy.layout.normalize()),

    Key([mod], "bracketleft", lazy.layout.grow()),
    Key([mod], "bracketright", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "r", lazy.layout.reset()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "m", minimize_all()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    Key([mod], "equal", change_gaps(5)),
    Key([mod], "minus", change_gaps(-5)),

    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "e", lazy.spawn(file_manager)),
    Key([mod], "b", lazy.spawn(browser)),
    #Key([mod], "v", lazy.spawn("emacsclient -c -a 'emacs' ")),
    Key([mod], "v", lazy.spawn(editor)),
    Key([mod], "d", lazy.spawn("discord")),
    
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 2%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 2%-")),
    
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse set Master toggle")),
    
    Key([mod], "Print", lazy.spawn("grim $HOME/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')", shell=True)),
    Key([], "Print", lazy.spawn("slurp | grim -g - $HOME/Pictures/Screenshots/$(date +'Screenshot_%Y-%m-%d-%H-%M-%S.png')", shell=True)),

    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),
    Key([mod], "Tab", lazy.next_layout()),

    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "Delete", lazy.spawn("shutdown -h now")),
    Key([mod], "w", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "w", lazy.spawn("rofi -show emoji")),

    Key([mod, "control"], "F1", lazy.core.change_vt(1)),
    Key([mod, "control"], "F2", lazy.core.change_vt(2)),
    Key([mod, "control"], "F3", lazy.core.change_vt(3)),
    Key([mod, "control"], "F4", lazy.core.change_vt(4)),
    Key([mod, "control"], "F5", lazy.core.change_vt(5)),
    Key([mod, "control"], "F6", lazy.core.change_vt(6)),
    Key([mod, "control"], "F7", lazy.core.change_vt(7)),
]

wl_input_rules = {
    "type:keyboard": InputConfig(kb_options="caps:escape_shifted_capslock,altwin:swap_alt_win"),
}

#groups = [
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
#]

groups=[
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
        ]
    )

ROSEWATER = "#f5e0dc"
FLAMINGO  = "#f2cdcd"
PINK      = "#f5c2e7"
MAUVE     = "#cba6f7"
RED       = "#f38ba8"
MAROON    = "#eba0ac"
PEACH     = "#fab387"
YELLOW    = "#f9e2af"
GREEN     = "#a6e3a1"
TEAL      = "#94e2d5"
SKY       = "#89dceb"
SAPPHIRE  = "#74c7ec"
BLUE      = "#89b4fa"
LAVENDER  = "#b4befe"
TEXT      = "#cdd6f4"
SUBTEXT1  = "#bac2de"
SUBTEXT0  = "#a6adc8"
OVERLAY2  = "#9399b2"
OVERLAY1  = "#7f849c"
OVERLAY0  = "#6c7086"
SURFACE2  = "#585b70"
SURFACE1  = "#45475a"
SURFACE0  = "#313244"
BASE      = "#1e1e2e"
MANTLE    = "#181825"
CRUST     = "#11111b"

layouts = [
    layout.Columns(
        border_focus=PINK,
        border_normal=CRUST, 
        border_on_single=False, 
        border_width=2, 
        fair=True,
        margin=0,
        wrap_focus_stack=True,
    ),
    # pants? wrestling?
    layout.Max(),
    layout.MonadTall(
        border_focus=PINK,
        border_normal=CRUST, 
        border_on_single=True, 
        border_width=2, 
        margin=0,
        wrap_focus_stack=False,
    ),
]

rd = RectDecoration(
    use_widget_background=True,
    radius=10,
    filled=True,
    group=True,
)

pll = PowerLineDecoration(path="back_slash")
plr = PowerLineDecoration(path="forward_slash")
pl = PowerLineDecoration(path="forward_slash")

rd_ = {"decorations": [rd]}
rd_pll = {"decorations": [rd, pll]}
rd_plr = {"decorations": [rd, plr]}

#bar_clr = mantle"]
bar_clr = "#00000000"

widget_defaults = dict(
    background=BASE,
    font="Noto Sans Medium",
    fontsize=16,
    foreground=TEXT,
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="/home/victoria/.config/qtile/wallpapers/albedo-wallpaper3.png",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.TextBox(
                    fmt=" 󰌠",
                    background=PINK,
                    foreground=BASE,
                    fontsize=30,
                    **rd_plr
                ),
                widget.GroupBox2(
                    disable_drag=True,
                    fontsize=22,
                    hide_unused=False,
                    padding_x=3,
                    rules=[
                        GroupBoxRule(block_colour=OVERLAY0).when(screen=ScreenRule.THIS, occupied=True),
                        GroupBoxRule(block_colour=OVERLAY0, text_colour=TEXT).when(screen=ScreenRule.THIS, occupied=False),
                        GroupBoxRule(block_colour=GREEN).when(screen=ScreenRule.OTHER),
                        GroupBoxRule(text_colour=PINK).when(occupied=True),
                        GroupBoxRule(text_colour=OVERLAY0).when(occupied=False),
                    ],
                    **rd_pll
                ),
                widget.WindowCount(
                    background=PINK,
                    fmt="{}  ",
                    fontsize=20,
                    foreground=BASE,
                    show_zero=True,
                    **rd_
                ),
                widget.Spacer(background=bar_clr),
                widget.Clock(
                    format="  🗓️%a, %d.%m.%Y 🕧%H:%M  ",
                    **rd_
                ),
                widget.Spacer(background=bar_clr),
                widget.StatusNotifier(padding=6, **rd_),
                widget.Spacer(length=10, background=bar_clr),
                widget.Spacer(length=10, background=PINK, **rd_),
                widget.WindowName(
                    background=PINK,
                    empty_group_string="  ",
                    fmt="{}",
                    foreground=BASE,
                    scroll=True,
                    scroll_delay=1,
                    scroll_fixed_width=False,
                    scroll_step=3,
                    width=200,
                    **rd_plr
                ),
                widget.Volume(
                    fmt="  🔊{}",
                    **rd_plr
                ),
                widget.Backlight(
                    fmt="🔆{}",
                    backlight_name="intel_backlight",
                    brightness_file="brightness",
                    **rd_plr
                ),
                widget.ThermalSensor(
                    tag_sensor="Core 0",
                    fmt="🔥{}",
                    **rd_plr
                ),
                widget.Battery(
                    charge_char="🔌",
                    discharge_char="🔋",
                    unknown_char="‼️",
                    format="{char}{percent:2.0%}",
                    full_char="💯",
                    update_interval=1,
                    show_short_text=False,
                    **rd_plr
                ),
                widget.CurrentLayout(
                    background=PINK,
                    fmt="{}  ",
                    foreground=BASE,
                ),
            ],
            36,
            background=bar_clr,
            #border_color=bar_clr,
            #border_width=[2, 2, 2, 2],
            #width=[4, 10, 0, 10],
        ),
        #x11_drag_polling_rate=60,
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position(),
         start=lazy.window.get_position(),
    ),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size(),
    ),
    Click([mod], "Button1", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=PINK,
    border_normal=BASE, 
    border_width=2,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  
        Match(wm_class="makebranch"),  
        Match(wm_class="maketag"),  
        Match(wm_class="ssh-askpass"),  
        Match(wm_class="mpv"),  
        Match(title="branchdialog"),  
        Match(title="pinentry"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    subprocess.run("/home/victoria/.local/bin/autostart.sh")
