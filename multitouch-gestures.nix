{ pkgs, ... }:
{
  /*
  This module enables the usage of 'Fusuma' a multi touch software.
  To set it up for your user do the following:
  1. Add your user to the group 'input'
  2. Create the config file ~/.config/fusuma/config.yml (config example after the last line)
  3. Start it with `fusuma -d`
  */
  environment.systemPackages = with pkgs; [
    fusuma
    xdotool
  ];
  users.extraUsers.stani = {
    extraGroups = [ "input" ];
  };
}
/*
Example configuration file for fusuma
swipe:
  3:
    left:
      command: 'xdotool key alt+Left'
    right:
      command: 'xdotool key alt+Right'
    up:
      command: 'xdotool key ctrl+t'
      threshold: 1.5
    down:
      command: 'xdotool key ctrl+w'
      threshold: 1.5
  4:
    left:
      command: 'xdotool key super+Left'
    right:
      command: 'xdotool key super+Right'
    up:
      command: 'xdotool key super+Up'
    down:
      command: 'xdotool key super+Down'
pinch:
  2:
    in:
      command: 'xdotool key ctrl+plus'
      threshold: 0.1
    out:
      command: 'xdotool key ctrl+minus'
      threshold: 0.1

threshold:
  swipe: 1
  pinch: 1

interval:
  swipe: 0
  pinch: 1
*/
