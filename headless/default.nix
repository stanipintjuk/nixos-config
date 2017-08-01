{ ... }:

{
  imports = [
    ./users.nix
    ./software.nix	
  ];

  i18n = {
    consoleKeyMap = "sv-latin1";
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";
}
