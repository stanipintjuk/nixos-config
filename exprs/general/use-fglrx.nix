# nix expression to enable the proprietary fglrx driver
{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

	services.xserver = {
		enable = true;
		videoDrivers = [ "ati_unfree" ];
	};
}
