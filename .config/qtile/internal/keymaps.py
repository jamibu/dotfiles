from typing import Callable
from libqtile import qtile
from libqtile.config import Key, Group
from libqtile.lazy import lazy
from libqtile.core.manager import Qtile


def add_vt_bindings(keys: list[Key]) -> list[Key]:
    # Add key bindings to switch VTs in Wayland.
    # We can't check qtile.core.name in default config as it is loaded before qtile is started
    # We therefore defer the check until the key binding is run by using .when(func=...)
    for vt in range(1, 8):
        keys.append(Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
    ))

    return keys


def add_group_bindings(keys: list, groups: list[Group], mod: str) -> list[Key]:
    for g in groups:
        # Goes to group without switching
        keys.append(Key(
            [mod, "control"],
            g.name,
            lazy.function(go_to_group(g.name)),
            desc=f"Go to group {g.name}"
        ))

        # Switches to group on current screen
        keys.append(Key(
            [mod],
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


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if name in '12345':
            qtile.focus_screen(1)
            qtile.groups_map[name].toscreen()
        elif name in "67890":
            qtile.focus_screen(0)
            qtile.groups_map[name].toscreen()

    return _inner


