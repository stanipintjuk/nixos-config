let
  secrets = import ../secrets.nix;
in
with builtins;
import  <nixos-18.09/nixos/tests/make-test.nix> {
  machine = import ../configuration.nix;
  
  testScript =
    ''
      $machine->start;

      # check that user stani is declared with the correct password
      $machine->succeed("cat /etc/passwd | grep stani");
      $machine->succeed("cat /etc/shadow | grep ${substring 20 80 secrets.passhash}");
    
      # check that it is indeed version 18.09 
      $machine->succeed("nixos-version | grep '^18\\.09'")
    '';
}
