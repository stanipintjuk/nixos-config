{ pkgs, ... }:
{
  services = {
    postgresql = {
      enable = true;

      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all ::1/128 trust
      '';
      initialScript = pkgs.writeText "backend-initScript" ''
        CREATE ROLE stani WITH LOGIN PASSWORD 'stani' CREATEDB;
        CREATE DATABASE stani;
        GRANT ALL PRIVILEGES ON DATABASE stani TO stani;
      '';
    };
  };
}
