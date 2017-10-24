{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git

    htop
    gnupg
    file
    mkpasswd #For generating hashed passwords
    pass # password manager
    pciutils
    glxinfo
    tree
    ranger
    gnumake
    unrar
    zip
    unzip
    lsof
    screenfetch
    usbutils
    python35Packages.livestreamer
    networkmanager
    nmap
    bc
    efibootmgr
    
    # languages and libs
    rustup
    python35Full
    python35Packages.pip
    python35Packages.virtualenv
    gcc
    libpng
  ];

  programs.java.enable = true;
}
