from libqtile import bar, widget, qtile
from internal.widgets import volume


def group_box(groups: list[str]) -> widget.GroupBox:
    return widget.GroupBox(
        visible_groups=groups,
        highlight_method="line",
        highlight_color=["#506d88"],
        other_current_screen_border=None,
        other_screen_border=None,
        font="Noto Sans JP ExtraBold",
    )


def power():
    qtile.cmd_spawn("sh -c ~/.config/rofi/powermenu/powermenu")


def init_bar_main(): 
    return bar.Bar(
        [
            widget.Image(
                filename='~/.config/qtile/assets/logo.png',
                margin=2,
                mouse_callbacks= {'Button1': power}
            ),
            group_box(["1", "2", "3", "4", "5"]),
            widget.Sep(),
            group_box(["6", "7", "8", "9", "0"]),
            widget.Spacer(),
            widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            widget.Spacer(),
            widget.StatusNotifier(),
            widget.Systray(),
            volume,
            widget.Spacer(length=10),
            widget.CurrentLayoutIcon(scale=0.75),
        ],
        25,
        opacity=0.8,
        background="#DC8A78",
    )
def init_bar(): 
    return bar.Bar(
        [
            widget.Image(
                filename='~/.config/qtile/assets/logo.png',
                margin=2,
                mouse_callbacks= {'Button1': power}
            ),
            group_box(["1", "2", "3", "4", "5"]),
            widget.Sep(),
            group_box(["6", "7", "8", "9", "0"]),
            widget.Spacer(),
            widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            widget.Spacer(),
            widget.CurrentLayoutIcon(scale=0.75),
        ],
        25,
        opacity=0.8
    )

