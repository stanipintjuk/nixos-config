# Enables redshift and sets the lat/lon to my specific location (Stockholm)
{ ... }:
{
	services.redshift = {
		enable = true;
		latitude = "59.32";
		longitude = "18.06";
	};
}
