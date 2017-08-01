{ ... }:
let 
   secrets = import ../secrets.nix;
in
{
  imports = [ ./asusac1300.nix ./nat.nix ];

  # Networking
  networking.hostName = secrets.hostName;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.extraHosts = ''
    192.168.2.10 raspberrypi
  '';
  services.openssh.enable = true;

  networking.wireless.enable = true;
  networking.wireless.networks = secrets.wifis ;
}
