import os
from libqtile import bar, widget, qtile
from widgets import volume
from keys import terminal


def init_bar_main():
    return bar.Bar(
        [
            widget.Sep(linewidth=0, padding=10),
            widget.CurrentLayoutIcon(scale=0.75),
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
            widget.CheckUpdates(
                update_interval=1800,
                distro="Arch_yay",
                display_format="{updates} Updates",
                foreground="#ffffff",
                mouse_callbacks={
                    'Button1':
                    lambda: qtile.cmd_spawn(terminal + ' -e yay -Syu')
                },
                background="#2f343f"),
            widget.Systray(icon_size = 20),
            volume,
            widget.Sep(linewidth=0, padding=10),
            widget.TextBox(text="", font="sans", fontsize=18),
            widget.Clock(format="%a %b %d %H:%M"),
            widget.Sep(linewidth=0, padding=10),
            widget.TextBox(
                text='',
                mouse_callbacks= {
                    'Button1':
                    lambda: qtile.cmd_spawn(os.path.expanduser('~/.config/rofi/powermenu.sh'))
                },
                foreground='#e39378',
                fontsize=18
            ),
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
            widget.TextBox(text="", font="sans", fontsize=18),
            widget.Clock(format="%a %b %d %H:%M"),
            widget.Sep(linewidth=0, padding=10),
        ],
        24
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )
