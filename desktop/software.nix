{ pkgs, ... }:
{

	environment.systemPackages = with pkgs; [
		feh
		imagemagick
		scrot
    xorg.xev

		i3lock
		i3status
		conky

		xfontsel
		rxvt_unicode

		# Emulation
		(wine.override { wineBuild = "wineWow"; })
		winetricks
		qemu

		# desktop apps
    thunderbird 
		firefox
		tdesktop
		inkscape
		transmission_gtk
		pidgin
		discord
		gimp
		xfce.thunar
		vlc

		# games
		steam
	];
}
