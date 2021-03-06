# Downloads and installs the latest intel microcode

{ lib, ... }:
with import ./helpers.nix;
  # I get the latest (2017-07-07) microcode from the nixpkgs master branch
let 
  masterPkgs = pkgsFromGit { url = "https://github.com/NixOS/nixpkgs"; rev = "bccac381b27592bdc22d151c744814716eb4f7ec"; sha256 = "1g8v4fbdm393fn11qv7mrqkysqisxxvsyx9wfr99kbffchsf5dbg"; };
  latestMicrocodeIntel = masterPkgs.microcodeIntel;
in
builtins.trace "Microcode in: ${latestMicrocodeIntel.outPath}"
{
  boot.initrd.prepend = lib.mkOrder 1 [ "${latestMicrocodeIntel}/intel-ucode.img" ];
}
# I had to do it this way because I don't 
# want to switch to a less stable channel 
# but still want get rid of that hyper threading bug in my i7.
