from libqtile import widget
from libqtile import qtile

colors = [
	      ["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]  # backbround for inactive screens
]


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
            self.text = '婢'
        else:
            if self.volume <= 0:
                self.text = '婢'
            elif self.volume <= 15:
                self.text = '奄'
            elif self.volume < 50:
                self.text = '奔'
            else:
                self.text = '墳'
        self.draw()
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.mute:
            self.text = '婢'
        else:
            if self.volume <= 0:
                self.text = '婢'
            elif self.volume <= 15:
                self.text = '奄'
            elif self.volume < 50:
                self.text = '奔'
            else:
                self.text = '墳'
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(self.volume) + "\n")

volume = MyVolume(
    fontsize=14,
    font='JetBrainsMono Nerd Font',
    foreground=colors[5],
    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")}
)
