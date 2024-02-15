#from libqtile import hook, qtile
from libqtile.lazy import lazy
#from libqtile.utils import send_notification

#from colors import catppuccin

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

#@hook.subscribe.layout_change
#def layout_change(layout, group):
#    global bar_clr 
#    if qtile.current_layout.name == "max":
#        send_notification(f"{layout.name}", f"Is now on group {group.label}")
#        bar_clr = catppuccin["mantle"]
#    if qtile.current_layout.name == "monadtall":
#        bar_clr = "#00000000"
#    elif qtile.current_layout.name == "columns":
#        bar_clr = "#00000000"
