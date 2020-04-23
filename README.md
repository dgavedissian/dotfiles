# dotfiles
My personal dotfiles. Managed by [dotbot](https://github.com/anishathalye/dotbot).

## Installation

First, ensure `python` is available. After that, to install dotfiles on any system, run:

	./install

If on Linux, install the 'desktop' configuration:

	./install desktop

then setup the polybar variables file `~/.dotfiles/polybar-variables.sh`, for example:

	export POLYBAR_HEIGHT=28
	export POLYBAR_NETWORK_INTERFACE=wlp2s0

## Further configuration

Ensure to setup DPI correctly in `~/.xprofile` if on hidpi screen.

## Dependencies

### Arch Linux

Desktop:

	pacman -S i3 sysstat rofi feh termite picom playerctl xorg-xrdb xorg-xbacklight network-manager-applet

Fonts:

	pacman -S ttf-font-awesome ttf-unifont noto-fonts siji-git

Bar:

	pacman -S polybar python-dbus python-gobject
