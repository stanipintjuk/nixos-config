with import <nixpkgs> {};
let
  pkgsFromRepo = { path }: 
    ((import (path + "/default.nix")) {}).pkgs;
in
{
  # Clones a nixpkgs git repo and returns all the packages within it
  pkgsFromGit = 
    { url, branch }:
    let 
      repoDrv = fetchgit { url = url; branchName = branch; };
      repoLocation = repoDrv.outPath;
    in
    ( builtins.trace 
    "WARNING: Use of foreign packages from ${url} on branch ${branch}"
    ( pkgsFromRepo { path = repoLocation; } )
    );
}
