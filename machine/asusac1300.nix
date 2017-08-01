# this file will make my Asus wifi dongle work
{ pkgs, ... }:
{
  boot.extraModulePackages = [ pkgs.linuxPackages.rtl8812au ];
  boot.kernelModules = [ "8812au" ];
}
