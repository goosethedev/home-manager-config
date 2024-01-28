{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."dunst".source = ../config_dirs/dunst;
}

