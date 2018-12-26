{ ... }:
{
  services.minidlna = {
    enable = true;
    mediaDirs = [ "/srv/public" ];
    config = ''
    notify_intervals=10
    '';
  };
}
