from libqtile.config import Screen
from bar import init_bar, init_bar_main


def init_screen_main():
    return Screen(
        top=init_bar_main(),
        wallpaper="~/Pictures/solarSystem.png",
        wallpaper_mode="stretch",
    )


def init_screen():
    bar = init_bar()
    return Screen(
        top=init_bar(),
        wallpaper="~/Pictures/solarSystem.png",
        wallpaper_mode="stretch",
    )


def init_screen_vert():
    return Screen(
        top=init_bar(),
        wallpaper="~/Pictures/fire.jpg",
        wallpaper_mode="stretch",
    )

