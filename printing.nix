{ pkgs, ... } :
{
  services.printing.enable = true;
  services.printing.drivers = [  pkgs.hplip pkgs.hplipWithPlugin ];
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];
}
