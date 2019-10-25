# Enables pulseadio
{ ... }:
{
	hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
	};
}
