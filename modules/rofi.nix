{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."rofi".source = ../config_dirs/rofi;
}


