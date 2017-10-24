# This is the place for users
{ ... }:
let
  secrets = import ./secrets.nix;
in
{
  users.mutableUsers = false;

  users.extraUsers.guest = {
    isNormalUser = true;
    password = "guest";
    uid = 1000;
  };

  users.extraUsers.stani = {
    isNormalUser = true;
    home = "/home/stani";
    description = "Stani Pintjuk";
    hashedPassword = secrets.passhash;

    extraGroups = [ "wheel" "networkmanager" "wwwrun"];
    uid = 1001;
  };
}
