from libqtile import bar, widget


def init_bar_main():
    return bar.Bar(
        [
            widget.Sep(linewidth=0, padding=10),
            widget.CurrentLayoutIcon(scale=0.75),
            widget.CurrentLayout(),
            widget.Prompt(),
            widget.Spacer(),
            widget.GroupBox(
                visible_groups=["1", "2", "3"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Sep(foreground="#a7b6c4"),
            widget.GroupBox(
                visible_groups=["4", "5", "6", "7"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Sep(foreground="#a7b6c4"),
            widget.GroupBox(
                visible_groups=["8", "9", "0"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Spacer(),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Systray(),
            widget.Clock(format="%a %b %H:%M"),
            widget.Sep(linewidth=0, padding=10),
        ],
        24,
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )


def init_bar():
    return bar.Bar(
        [
            widget.Sep(linewidth=0, padding=10),
            widget.CurrentLayoutIcon(scale=0.75),
            widget.CurrentLayout(),
            widget.Prompt(),
            widget.Spacer(),
            widget.GroupBox(
                visible_groups=["1", "2", "3"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Sep(foreground="#a7b6c4"),
            widget.GroupBox(
                visible_groups=["4", "5", "6", "7"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Sep(foreground="#a7b6c4"),
            widget.GroupBox(
                visible_groups=["8", "9", "0"],
                highlight_method="line",
                highlight_color=["#506d88"],
                other_current_screen_border=None,
                other_screen_border=None,
            ),
            widget.Spacer(foreground="#a7b6c4"),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.TextBox(text="", font="sans"),
            widget.Clock(format="%a %b %H:%M"),
            widget.Sep(linewidth=0, padding=10),
        ],
        24
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )
