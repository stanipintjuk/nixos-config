{ ... }:
{
  services.samba = {
    enable = true;
    shares = {
      public = { 
        browseable = "yes"; 
        comment = "Public samba share.";
        "guest ok" = "yes"; 
        path = "/srv/public"; 
        "read only" = true; 
      }; 
    };
  };
}
