{ ... }:
{
  networking.nat.enable = true;
  networking.nat.internalIPs = [ "192.168.2.0/24" ];
  networking.nat.externalInterface = "wlp0s20f0u8";
  networking.interfaces.enp4s0.ipAddress = "192.168.2.1";
  networking.interfaces.enp4s0.prefixLength = 24;

  services.dhcpd4 = {
    enable = true;
    interfaces = [ "enp4s0" ]; 
    extraConfig = ''
      ddns-update-style none;
      #option subnet-mask         255.255.255.0;
      one-lease-per-client true;

      subnet 192.168.2.0 netmask 255.255.255.0 {
        range 192.168.2.10 192.168.2.254;
        authoritative;

        # Allows clients to request up to a week (although they won't)
        max-lease-time              604800;
        # By default a lease will expire in 24 hours.
        default-lease-time          86400;

        option subnet-mask          255.255.255.0;
        option broadcast-address    192.168.2.255;
        option routers              192.168.2.1;
        option domain-name-servers  206.248.154.22, 206.248.154.170;
      }
    '';
  };
}
