from libqtile import widget
from libqtile import qtile

widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    fontsize=14,
    padding=1,
)

extension_defaults = widget_defaults.copy()
class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume, self.mute = self.get_volume()
        if self.mute:
            self.text = ' '
        else:
            if self.volume <= 0:
                self.text = ' '
            elif self.volume <= 33:
                self.text = ' '
            elif self.volume < 66:
                self.text = ' '
            else:
                self.text = ' '
        self.draw()
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.mute:
            self.text = ' '
        else:
            if self.volume <= 0:
                self.text = ' '
            elif self.volume <= 33:
                self.text = ' '
            elif self.volume < 66:
                self.text = ' '
            else:
                self.text = ' '
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(self.volume) + "\n")

volume = MyVolume(
    fontsize=14,
    font='JetBrainsMono Nerd Font',
    foreground="#da8548",
    mouse_callbacks = {'Button1': lambda: qtile.spawn("pavucontrol")},
)
