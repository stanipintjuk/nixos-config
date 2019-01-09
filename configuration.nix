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

  networking.firewall.enable = false;

  nixpkgs.config.allowUnfree = true;
  imports =
    [ 
      ./hardware-configuration.nix
      ./users.nix
      ./software.nix
      ./apps.nix

      ./exprs/specific/enable-redshift.nix
      ./exprs/specific/enable-my-wifi.nix
      httpserver
      ./exprs/specific/my-preferred-cli.nix
      ./exprs/specific/minidlna.nix

      ./exprs/general/enable-pulseaudio.nix
      ./postgressql.nix
      ./exprs/general/systemdboot.nix
      
      ./printing.nix
      ./freenet.nix
    ];
    
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  services.keybase.enable = true;
  services.kbfs = 
  {
    enable = true;
    mountPoint = "/keybase";
  };


  networking.extraHosts = ''
  '';

  nix.buildCores = 8;
  time.timeZone = "Europe/Stockholm";

  # Networking
  services.openssh.enable = true;
  networking.nameservers = [ "192.168.1.1" "8.8.8.8" "8.8.4.4" ];
  networking.enableIPv6 = false;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";
  
  security.pki.certificates = [
''
-----BEGIN CERTIFICATE-----
MIIDAzCCAeugAwIBAgIJAP2Pn+GKijWWMA0GCSqGSIb3DQEBCwUAMBgxFjAUBgNV
BAMMDW1haWwuc3Rhbmkuc2UwHhcNMTgwMzMxMTMyNzU2WhcNMjgwMzI4MTMyNzU2
WjAYMRYwFAYDVQQDDA1tYWlsLnN0YW5pLnNlMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAxTuMu/X2XUSzjWBC8/zuVAq0j3A8w3cmwxP+O3rGpcNl9vVq
MsV+cbXXelB4wAD7Vmc7AjFrAhKUMv4rG6a9SO63ALJRSUlEJArVTKUmZzqWkj41
3z2iR3miXzZs5hKYsTQj2cETxGEnFpzS9CYUlfRUdWxs8cGP3Tfu3sEc3yeUbwTS
wcQmpk6cxTONEhf11jKn12RriDX1mkjGBtGBmnmnQxWhbdeNX2S4zhmVtAguf4oB
HsuWg6lRFiNaMAmMm+GTYyEwsj+dyHOLmU/+iv/9XyPj8/C0jPRcQ9VZO1ScQ1e1
DpCGNpx1YV52MSeaUphBsf2LRzt9fHndQirwBwIDAQABo1AwTjAdBgNVHQ4EFgQU
RPZsmijyqRnqnVOWaRT8yGl6PEowHwYDVR0jBBgwFoAURPZsmijyqRnqnVOWaRT8
yGl6PEowDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAENd4h18uvjU+
XSiUmvCq1h588CNYkpa7evw0xgMMngm9lftyhCH4dfaZdXCEsIEFS2AmkqRUWf2m
Ec6a8murjuewtpcW+EgIg1tmH3pg6mAXE5Y75rVwaeT+QpZSVHCQDElOQjTWE+iz
229o4CFFT/bf2C0JOEMKpUZWwW6RI31v/svJZKtwKm7Z7wea9Ep/078AR6N4O3ay
aj8j0rwESmf9weQWfjfIxF1JWC0/UkPYqDSXzGuBd18XXkhKx14I3VdrqJgPf57V
bdkN/DAUxVI/FzmYAnUL7OMQA95onAsHi+7grUBV5MkbR5whtAv/EWER8QUhPtgW
9Zevuwj0lw==
-----END CERTIFICATE-----
''
  ];
}
