{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."xkb".source = ../config_dirs/xkb;
}


