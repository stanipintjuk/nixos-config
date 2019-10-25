# Enables redshift and sets the lat/lon to my specific location (Stockholm)
{ ... }:
{

  location = {
    latitude = 59.32;
    longitude = 18.06;
  };
	services.redshift = {
		enable = true;
    brightness = {
      day = "1.0";
      night = "0.1";
    };
    temperature = {
      night = 25000;
    };
	};
}
