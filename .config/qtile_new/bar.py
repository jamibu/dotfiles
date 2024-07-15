from libqtile import bar, widget
from widgets import volume


# def power():
#     qtile.cmd_spawn("sh -c ~/.config/rofi/scripts/power")


laptop_bar = bar.Bar(
    [
        widget.Image(
            filename='~/.config/qtile/assets/logo.png',
            margin=2,
            background='#282738',
            # mouse_callbacks={"Button1":power},
        ),
        widget.GroupBox(
            # visible_groups=["1", "2", "3"],
            highlight_method="border",
            highlight_color=["#506d88"],
            other_current_screen_border=None,
            other_screen_border=None,
        ),
        widget.Spacer(),
        widget.WindowName(),
        widget.Spacer(),
        # widget.Chord(
        #     chords_colors={
        #         "launch": ("#ff0000", "#ffffff"),
        #     },
        #     name_transform=lambda name: name.upper(),
        # ),
        # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
        # widget.StatusNotifier(),
        widget.Systray(),
        volume,
        widget.Sep(linewidth=0, padding=5),
        widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
        widget.QuickExit(),
        widget.CurrentLayoutIcon(scale=0.75),
    ],
    28,
    # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
    # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
)
