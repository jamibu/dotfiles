from libqtile.config import Screen
from bar import init_bar, init_bar_main


def init_screen_main():
    return Screen(
        top=init_bar_main(),
        wallpaper="~/Pictures/Backgrounds/river.jpg",
        wallpaper_mode="stretch",
    )


def init_screen():
    return Screen(
        top=init_bar(),
        wallpaper="~/Pictures/Backgrounds/river.jpg",
        wallpaper_mode="stretch",
    )


def init_screen_vert():
    return Screen(
        top=init_bar(),
        wallpaper="~/Pictures/Backgrounds/fire.jpg",
        wallpaper_mode="stretch",
    )
