{ ... }:
{
# Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    

    grub = {
      gfxmodeEfi="1920x1080";
      enable = true;
      version = 2;
      #forceInstall = true;

      device = "/dev/sdb";
      efiSupport = true;

      extraEntries = ''
        menuentry "Super Grub2Disk" {
          chainloader /grub2disk.efi
        }
      '';
  
      splashImage = ../rice/art/the-technomancer.png;

      extraFiles = { "grub2disk.efi" = /home/stani/isos/super_grub2_disk_standalone_x86_64_efi_2.02s9.EFI; };
    };
  };
}
