{ pkgs, ...} : {

  environment.systemPackages = with pkgs; [
    gwenview
    okular
    kdeconnect

    quota
    plasma-desktop
    kdeplasma-addons
    plasma5.khotkeys
    plasma-integration
    plasma-nm
    plasma-browser-integration
    plasma-pa
    plasma-vault
    plasma-workspace
    plasma-workspace-wallpapers
    plasma5.polkit-kde-agent
    plasma5.powerdevil
    plasma5.sddm-kcm
    plasma5.systemsettings
    plasma5.user-manager
    plasma5.xdg-desktop-portal-kde

    # These are not kde specific
    qtpass
    accountsservice
    dbus
  	kdeFrameworks.kdbusaddons
    libaccounts-glib

  ];

  services.accounts-daemon.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
}
