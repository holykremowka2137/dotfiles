from libqtile.lazy import lazy

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
