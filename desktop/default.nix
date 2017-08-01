{ pkgs, ... }:
{
	imports = [ ./software.nix ];

	services.redshift = {
		enable = true;
		latitude = "59.32";
		longitude = "18.06";
	};

	# Enable the X11 windowing system.
	services.xserver = {
		enable = true;
		layout = "se";
		xkbOptions = "caps:escape";
		videoDrivers = [ "ati_unfree" ];
	};

	hardware = {
		pulseaudio = {
			enable = true;
			support32Bit = true;
		};

		opengl = {
			driSupport = true;
			driSupport32Bit = true;
		};
	};
	
	sound.mediaKeys.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.windowManager.i3.enable = true;
}
