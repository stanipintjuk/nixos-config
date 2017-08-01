# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.

      ./machine/default.nix
      ./headless/default.nix
      ./desktop/default.nix
      ./rice/rice.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.buildCores = 8;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}