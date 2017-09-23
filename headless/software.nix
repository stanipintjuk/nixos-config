{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # cli stuff that I NEED
    wget
    git

    (
      with import <nixpkgs> {};
      
      vim_configurable.customize {
        name = "vim";
        vimrcConfig.customRC = builtins.readFile ../dotfiles/vimrc;
      }
    )

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
    rustStable.rustc
    rustStable.cargo
    python35Full
    python35Packages.pip
    python35Packages.virtualenv
    gcc
    libpng
  ];


  # Default programs
  programs.zsh.enable = true;
  users.defaultUserShell = "/var/run/current-system/sw/bin/zsh";
  programs.vim.defaultEditor = true;
  programs.java.enable = true;
}
