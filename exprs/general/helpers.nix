with import <nixpkgs> {};
let
  pkgsFromRepo = { path }: 
    ((import (path + "/default.nix")) {}).pkgs;
in
{
  # Clones a nixpkgs git repo and returns all the packages within it
  pkgsFromGit = 
    { url, rev, sha256}:
    let 
      repoDrv = fetchgit { inherit url rev sha256; };
      repoLocation = repoDrv.outPath;
    in
    ( builtins.trace 
    "WARNING: Use of foreign packages from ${url} on revision ${rev}"
    ( pkgsFromRepo { path = repoLocation; } )
    );
}
