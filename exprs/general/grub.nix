# Returns a nixos expression that
# * Disables systemd-boot
# * Installs grub2 in the specified `device` (e.g. /dev/sda)
# * Sets the grub screensize to full HD (1920x1080)
# * Assumes the EFI mountpount point is /boot

{ 
  efiMountPoint ? "/boot/"  # Where the efi filesystem is mounted.
}:
{ ... }:
{
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = efiMountPoint;


    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
    };
  };
}
