{ config, pkgs, lib, ... }:

let
  configFiles = [
    "main"
    # "hyprland"
    "media"
    "keybinds"
  ];

  toSource = file: { "hypr/${file}.conf".source = ./.. + "/config_dirs/hypr/${file}.conf"; };
  
  # Build attrset with configFiles, including hyprpaper
  configFileSet = builtins.foldl' (acc: elem: acc // elem) {} (map toSource (configFiles ++ [ "hyprpaper" ]));
in {

  # Map configFiles to ~/.config/hypr, including wallpapers dir
  xdg.configFile = configFileSet // {
    "hypr/wallpapers".source = ../config_dirs/hypr/wallpapers;
  };

  # Enable Hyprland and create hyprland.conf
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Source configFiles symlinked, including a custom one
      # for additional adhoc configurations
      "source" = map (file: "~/.config/hypr/${file}.conf") (configFiles ++ [ "custom" ]); 
    };
  };

  # Set files in ~/.config/hypr
  # xdg.configFile."hypr" = {
  #   "".source = ../config_dirs/hypr;
  # };
}

