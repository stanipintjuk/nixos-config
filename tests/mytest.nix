let
  secrets = import ../secrets.nix;
in
with builtins;
import  <nixpkgs/nixos/tests/make-test.nix> {
  machine = import ../configuration.nix;
  
  testScript =
    ''
      $machine->start;

      # check that user stani is declared with the correct password
      $machine->succeed("cat /etc/passwd | grep stani");
      $machine->succeed("cat /etc/shadow | grep ${substring 20 80 secrets.passhash}");
    
      # Test that fglrx module is loaded
      $machine->waitForUnit("display-manager.service");
      $machine->succeed("lsmod | grep fglrx");
    '';
}
