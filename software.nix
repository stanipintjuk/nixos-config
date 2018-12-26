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
    highlight
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
    openssl
    keybase
    dnsutils
    kbfs
    nix-repl
    qrencode
    
    # languages and libs
    rustup
    python35Full
    python35Packages.pip
    python35Packages.virtualenv
    gcc
    libpng

    #themes
    arc-theme
    arc-icon-theme
    #numix-solarized-gtk-theme
    gtk3
  ];

  programs.java.enable = true;
}
