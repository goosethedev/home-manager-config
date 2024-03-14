{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.eww;
    configDir = ../config_dirs/eww/config;
  };

  # Dependencies
  home.packages = with pkgs; [
    jq
    socat
  ];
}
