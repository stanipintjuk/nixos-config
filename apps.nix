{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ feh imagemagick scrot xorg.xev

    i3lock i3status conky

    xfontsel rxvt_unicode

    # Emulation
    #(wine.override { wineBuild = "wineWow"; }) #tired of recompiling
    #constantly
    wine 
    winetricks 
    qemu
    gnome3.gnome-boxes
    atom

    # desktop apps
    thunderbird firefox
		tdesktop
		inkscape
		transmission_gtk
		pidgin
		discord
		gimp
		xfce.thunar
		vlc
    pavucontrol
    keybase-gui
    mupdf
    nextcloud-client
    chromium
    skype

		# games
		steam
    minecraft
    xonotic
    superTuxKart

    libreoffice
    gnuplot
	];
}
