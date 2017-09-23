{ ... }:
{
  # Simple apache server setup
  # for my nixos-pinebook developement environment
  services.httpd = {
    enable = true;
    adminAddr = "none@furbs.ns";
    servedDirs = [
      { dir = "/var/www/nixos-17.03-pinebook"; urlPath = "/nixos-17.03-pinebook"; } 
      { dir = "/var/www/nixos-17.03-pinebook-cache"; urlPath = "/nixos-17.03-pinebook-cache"; } 
    ];
  };
}
