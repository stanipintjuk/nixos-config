{ ... }:
let
  secrets = import ../../secrets.nix;
in
{
  imports = [
    ../general/asusac1300.nix
  ];

  networking.wireless.enable = true;
  networking.wireless.networks = secrets.wifis ;
}
