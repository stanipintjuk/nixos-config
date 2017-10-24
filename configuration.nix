# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:
let
  secrets = import ./secrets.nix;

  # Create an nix channel http server for the pinebook nixos project
  httpserver = import ./exprs/general/servehttp.nix 
    [
      { dir = "/var/www/nixos-17.03-pinebook"; urlPath = "/nixos-17.03-pinebook"; } 
      { dir = "/var/www/nixos-17.03-pinebook-cache"; urlPath = "/nixos-17.03-pinebook-cache"; } 
    ];
in
{

  imports =
    [ 
      ./hardware-configuration.nix
      ./users.nix
      ./software.nix
      ./apps.nix

      ./rice/rice.nix
      ./exprs/specific/enable-redshift.nix
      ./exprs/specific/route-to-pi.nix
      ./exprs/specific/enable-my-wifi.nix
      httpserver
      ./exprs/specific/my-preferred-cli.nix

      ./exprs/general/latest-intel-microcode.nix
      #./exprs/general/bluez-pulseaudio.nix
      ./exprs/general/use-fglrx.nix
      ./exprs/general/enable-pulseaudio.nix
      ./exprs/general/systemdboot.nix

    ];

  nix.buildCores = 8;
  time.timeZone = "Europe/Stockholm";

  # Networking
  networking.hostName = secrets.hostName;
  services.openssh.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.enableIPv6 = false;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";
}
