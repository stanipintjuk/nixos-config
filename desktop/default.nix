{ pkgs, ... }:
{

	# Enable the X11 windowing system.
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
}
