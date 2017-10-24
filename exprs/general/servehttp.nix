# Starts a httpd and serves the given directories
servedDirs:
{ ... }:
{
  # Simple apache server setup
  # for my nixos-pinebook developement environment
  services.httpd = {
    enable = true;
    adminAddr = "none@furbs.ns";
    servedDirs = servedDirs;
  };
}
