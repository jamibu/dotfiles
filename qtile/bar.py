from libqtile import bar, widget


def init_bar_main():
    return bar.Bar(
        [
            widget.CurrentLayoutIcon(scale=0.75),
            widget.CurrentLayout(),
            widget.Prompt(),
            widget.Spacer(),
            widget.GroupBox(),
            widget.Spacer(),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Systray(),
            widget.Pomodoro(),
            widget.Clock(format="%a %b %H:%M"),
        ],
        24,
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )


def init_bar():
    return bar.Bar(
        [
            widget.CurrentLayoutIcon(scale=0.75),
            widget.CurrentLayout(),
            widget.Prompt(),
            widget.Spacer(),
            widget.GroupBox(),
            widget.Spacer(),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Clock(format="%a %b %H:%M"),
        ],
        24
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )
