{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."fcitx5".source = ../config_dirs/fcitx5;
}


