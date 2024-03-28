
{ config, pkgs, lib, ... }:

{
  imports = [
    # Main config
    ./common.nix

    # Modules
    ../modules/dunst
    ../modules/eww
    ../modules/hyprland
    ../modules/kitty
    ../modules/pass
    ../modules/rofi
    ../modules/vscode
    # ../modules/wezterm
    ../modules/xkb
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # Local packages
  home.packages = with pkgs; [
    bitwarden
    discord
    element-desktop
    gammastep
    grimblast
    gthumb
    pcmanfm
    ytui-music
    
    # For OpenGL programs e.g. kitty
    nixgl.auto.nixGLDefault
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
    "XDG_SESSION_TYPE" = "wayland";
  };

  # Start Hyprland on TTY login
  programs.zsh.profileExtra = ''
    nixGL Hyprland
  '';
}

