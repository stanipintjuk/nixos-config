#Enables bluetooth headset using bluez5 and pulseaudio
{ pkgs, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
    };
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };
  services.blueman.enable = true;
}
