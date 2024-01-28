{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."hypr".source = ../config_dirs/hypr;
}

