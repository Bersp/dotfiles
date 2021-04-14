config.load_autoconfig(False)

import os

### Binding ###
config.bind('xx', 'config-cycle tabs.show always switching')
config.bind('gF', 'spawn vivaldi-stable {url}')

### URL ###
c.url.start_pages = ["https://www.google.com/"]
c.url.searchengines = {"DEFAULT": "https://www.google.com.ar/search?q={}"}

### Fonts ###
c.fonts.web.family.standard = "NotoSans-Regular"
c.fonts.web.family.sans_serif = "NotoSans-Regular"
c.fonts.web.family.serif = "NotoSans-Regular"

c.fonts.tabs.selected = "11pt Monaco for Powerline"
c.fonts.tabs.unselected = "11pt Monaco for Powerline"

### OTHER OPTIONS ###
config.set('statusbar.show', 'in-mode')
c.completion.height = '30%'
c.tabs.padding = {"bottom": 5, "left": 20, "right": 20, "top": 5}
c.input.insert_mode.auto_leave = False

### COLORS ###
import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

color0 = xresources['*.color0']
color1 = xresources['*.color1']
color2 = xresources['*.color2']
color3 = xresources['*.color3']
color4 = xresources['*.color4']
color5 = xresources['*.color5']
color6 = xresources['*.color6']
color7 = xresources['*.color7']
color8 = xresources['*.color8']
color9 = xresources['*.color9']
color10 = xresources['*.color10']
color11 = xresources['*.color11']
color12 = xresources['*.color12']
color13 = xresources['*.color13']
color14 = xresources['*.color14']
color15 = xresources['*.color15']

# Background color of the completion widget category headers.
c.colors.completion.category.bg = color0

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = color0

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = color0

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = color7

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = color0

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = color0

# Text color of the completion widget.
# Type: QtColor
c.colors.completion.fg = color7

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = color8

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = color8

# Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = color8

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = color15

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = color11

# Color of the scrollbar in completion view
c.colors.completion.scrollbar.bg = color0

# Color of the scrollbar handle in completion view.
c.colors.completion.scrollbar.fg = color7

# Background color for the download bar.
c.colors.downloads.bar.bg = color0

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = color1

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = color7

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = color13

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = color11

# Font color for hints.
c.colors.hints.fg = color0

# Font color for the matched part of hints.
c.colors.hints.match.fg = color4

# Background color of the keyhint widget.
c.colors.keyhint.bg = color0

# Text color for the keyhint widget.
c.colors.keyhint.fg = color7

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = color11

# Background color of an error message.
c.colors.messages.error.bg = color1

# Border color of an error message.
c.colors.messages.error.border = color1

# Foreground color of an error message.
c.colors.messages.error.fg = color7

# Background color of an info message.
c.colors.messages.info.bg = color6

# Border color of an info message.
c.colors.messages.info.border = color6

# Foreground color an info message.
c.colors.messages.info.fg = color7

# Background color of a warning message.
c.colors.messages.warning.bg = color1

# Border color of a warning message.
c.colors.messages.warning.border = color1

# Foreground color a warning message.
c.colors.messages.warning.fg = color7

# Background color for prompts.
c.colors.prompts.bg = color8

 ## Border used around UI elements in prompts.
 ## Type: String
c.colors.prompts.border = '1px solid ' + color0

# Foreground color for prompts.
c.colors.prompts.fg = color7

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = color8

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = color13

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = color7

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = color13

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = color7

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = color8

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = color7

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = color8

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = color7

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = color10

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = color0

# Background color of the statusbar.
c.colors.statusbar.normal.bg = color0

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = color7

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = color4

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = color7

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = color8

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = color7

# Background color of the progress bar.
c.colors.statusbar.progress.bg = color7

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = color1

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = color7

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = color6

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = color7

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = color10

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = color1

# Background color of the tab bar.
c.colors.tabs.bar.bg = color8

# Background color of unselected even tabs.
c.colors.tabs.even.bg = color8

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = color7

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = color1

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = color6

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = color1

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = color8

# Background color of unselected even tabs.
c.colors.tabs.even.bg = color8

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = color0

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = color0

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = color7

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = color7

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = color7
