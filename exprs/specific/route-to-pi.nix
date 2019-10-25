# Uses mkRouter.nix to create a router on my hardware.
{ ... }:
let
  mkRouter  = import ../../router/mkRouter.nix;
in
{
  imports = [
    (mkRouter {
      internalInterface = "enp4s0";
      externalInterface = "wlp0s20f0u5";
    })
  ];

  # For some reason the client host names aren't available when using mkRouter.nix
  # so I have to manually specify my raspberrypi's hostname here, and hope that 
  # it doesn't change the IP address.
  networking.extraHosts = ''
    192.168.2.10 raspberrypi
  '';
}
