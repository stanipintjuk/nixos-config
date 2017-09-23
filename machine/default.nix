{ ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix 
    ./bluetooth.nix
    ./networking.nix
  ];
}
