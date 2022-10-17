from typing import Callable
from libqtile.lazy import lazy
from libqtile.config import Key, Group
from libqtile.core.manager import Qtile


def init_groups() -> list:
    groups = [
        Group("1", layout="monadtall", persist=True),
        Group("2", layout="monadtall", persist=True),
        Group("3", layout="max", persist=True),
        Group("4", spawn="alacritty", layout="monadtall", persist=True),
        Group("5", layout="monadtall", persist=True),
        Group("6", layout="monadtall", persist=True),
        Group("7", layout="max", persist=True),
        Group("8", layout="monadwide", persist=True),
        Group("9", layout="monadwide", persist=True),
        Group("0", layout="monadwide", persist=True),
    ]

    return groups


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '123':
            qtile.focus_screen(2)
            qtile.groups_map[name].cmd_toscreen()
        elif name in "4567":
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        elif name in "890":
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner


def assign_group_keys(keys: list, mod: str, groups: list) -> list:
    for g in groups:
        # Goes to group without switching
        keys.append(Key(
            [mod],
            g.name,
            lazy.function(go_to_group(g.name)),
            desc=f"Go to group {g.name}"
        ))

        # Switches to group on current screen
        keys.append(Key(
            [mod, "control"],
            g.name,
            lazy.group[g.name].toscreen(),
            desc=f"Switch to group {g.name}",
        ))

        # Move window to group without switching
        keys.append(Key(
            [mod, "shift"],
            g.name,
            lazy.window.togroup(g.name),
            desc="Move focused window to group {}".format(g.name)
        ))

    return keys

