{ ... }:
let 
   secrets = import ../secrets.nix;
in
{
  imports = [ 
    ./asusac1300.nix 

    (import ../router/mkRouter.nix {
      internalInterface = "enp4s0";
      externalInterface = "wlp0s20f0u8";
      ipRange = "192.168.7.0/24";
    })
  ];

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
