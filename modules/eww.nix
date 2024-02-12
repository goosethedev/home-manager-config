{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ../config_dirs/eww/config;
  };

  # Dependencies
  home.packages = with pkgs; [
    jq
    socat
  ];
}
