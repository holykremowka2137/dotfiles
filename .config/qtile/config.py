from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from qtile_extras import widget
# from qtile_extras.widget import BorderDecoration
import os, subprocess, colors   

mod = "mod1"

@lazy.layout.function
def increase_gaps(layout, steps = 10):
    if not hasattr(layout, "margin"):
        return

    if not isinstance(layout.margin, int):
        return

    layout.margin = max(layout.margin + step, 0)
    layout.group.layout_all()

keys = [
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),

    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "n", lazy.layout.normalize()),

    Key([mod], "equal", increase_gaps()),
    Key([mod], "minus", increase_gaps(step = -10)),

    Key([mod], "Return", lazy.spawn("alacritty")),
    Key([mod], "e", lazy.spawn("nemo")),
    Key([mod], "b", lazy.spawn("librewolf")),
    # Key([mod], "v", lazy.spawn("emacsclient -c -a 'emacs' ")),
    Key([mod], "v", lazy.spawn("alacritty -e nvim")),
    
    Key([], "XF86MonBrightnessUp", lazy.spawn("brillo -A 2")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brillo -U 2")),
    
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse set Master toggle")),
    
    # Key(["Print"], lazy.spawn("screenshot select")),

    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),
    Key([mod], "Tab", lazy.next_layout()),

    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "shift"], "q", lazy.spawn("shutdown -h now")),
    Key([mod], "w", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "w", lazy.spawn("rofi -show emoji")),
]

groups = []
group_names  = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
# group_labels = ["一", "ニ", "三", "四", "五", "六", "七", "八", "九", "零"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name = group_names[i],
            # layout=group_layouts[i].lower(),
            label = group_labels[i],
        )
    )

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group = True)),
            Key([mod, "control"], i.name, lazy.window.togroup(i.name)),
        ]
    )

catppuccin = {
    "flamingo": "#F3CDCD",
    "mauve": "#DDB6F2",
    "pink": "#f5c2e7",
    "maroon": "#e8a2af",
    "red": "#f28fad",
    "peach": "#f8bd96",
    "yellow": "#fae3b0",
    "green": "#abe9b3",
    "teal": "#b4e8e0",
    "blue": "#96cdfb",
    "sky": "#89dceb",
    "white": "#d9e0ee",
    "gray": "#6e6c7e",
    "black": "#1a1826",
    }

layouts = [
    layout.Columns(
        border_focus = catppuccin["pink"],
        border_normal = catppuccin["black"], 
        border_on_single = True, 
        border_width = 1, 
        fair = True,
        margin = 10, 
        wrap_focus_stack = False,
    ),
    layout.Max(),
    # layout.Floating(
    #     border_width = 1,
    #     border_focus = colors[5],
    #     border_normal = colors[0],
    # )
]

widget_defaults = dict(
    font = "JetBrains Mono NF Bold",
    fontsize = 15,
    padding = 0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper = "~/.config/qtile/wallpapers/wallpaperflare.com_wallpaper2.png",
        wallpaper_mode = "fill",

        top = bar.Bar(
            [
                widget.GroupBox(
                    disable_drag = True,
                    # hide_unused = True,
                    active = catppuccin["pink"],
                    highlight_method = "line",
                    fontsize = 20,
                    font = "JetBrains Mono NF",
                    background=catppuccin["black"],
                    highlight_color=[catppuccin["pink"], catppuccin["pink"]],
                    inactive=catppuccin["gray"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.TaskList(
                    icon_size = 25,
                    font = "JetBrains Mono NF",
                    fontsize = 17,
                    foreground = catppuccin["white"],
                    background = catppuccin["black"],
                    borderwidth = 0,
                    border = catppuccin["pink"],
                    highlight_method = "block",
                    title_width_method = "uniform",
                    urgent_alert_method = "border",
                    urgent_border = catppuccin["red"],
                    rounded = True,
                    txt_floating = "🗗 ",
                    txt_maximized = "🗖 ",
                    txt_minimized = "🗕 ",
                ),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Systray(
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Clock(
                    format = "🕧%I:%M %p",
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Volume(
                    fmt = "🔊{}",
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Battery(
                    charge_char = "🔌",
                    discharge_char = "🔋",
                    unknown_char = "‼️",
                    format = "{char}{percent:1.0%}",
                    full_char = "100%",
                    update_interval = 1,
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Backlight(
                    fmt = "🔆{}",
                    backlight_name = "intel_backlight",
                    brightness_file = "brightness",
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.ThermalSensor(
                    tag_sensor = "Core 0",
                    fmt = "🔥{}",
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
                widget.Clock(
                    format = "📆%d.%m.%Y",
                    background = catppuccin["black"],
                ),
                widget.Spacer(length = 10, background=catppuccin["black"],),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

### DRAG FLOATING LAYOUTS. ###
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules = [
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class = "confirmreset"),  # gitk
        Match(wm_class = "makebranch"),  # gitk
        Match(wm_class = "maketag"),  # gitk
        Match(wm_class = "ssh-askpass"),  # ssh-askpass
        Match(title = "branchdialog"),  # gitk
        Match(title = "pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    subprocess.run("/home/victoria/.config/qtile/autostart.sh")

# XXX: Gasp! We"re lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn"t work correctly. We may as well just lie
# and say that we"re a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java"s whitelist.
wmname = "qtile"