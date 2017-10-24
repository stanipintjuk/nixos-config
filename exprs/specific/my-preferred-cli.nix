# Configuration of zsh, vim and other stuff that I require in order to use a computer with a keyboard
{ pkgs, ... }:

let
  myCustomVim = (with import <nixpkgs> {};
      vim_configurable.customize {
        name = "vim";
        vimrcConfig.customRC = builtins.readFile ../../dotfiles/vimrc;
      }
    );
in
{
  i18n.consoleKeyMap = "sv-latin1";
  environment.systemPackages = [
    myCustomVim
  ];

  programs.zsh.enable = true;
  programs.vim.defaultEditor = true;
  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
  
  # use swedish keys and map capslock to escape
  services.xserver = {
    layout = "se";
    xkbOptions = "caps:escape";
  };
}
