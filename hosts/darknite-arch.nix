
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
    # Override Nix kitty package with bin pointing to Arch local package that uses nixGLNvidia
    ".local/bin/kitty" = {
      enable = true;
      executable = true;
      text = "${pkgs.nixgl.auto.nixGLDefault} ${pkgs.kitty}";
      # TODO: Investigate how to do this
      # text = "${pkgs.nixgl.auto.nixGLNvidia} /usr/bin/kitty";
    };
  };

  # Set env vars
  home.sessionVariables = {
    # Hyprland variables
    # NixOS sets them automatically, Arch doesn't
    # "LIBVA_DRIVER_NAME" = "nvidia";
    "XDG_SESSION_TYPE" = "wayland";
    # env = GBM_BACKEND,nvidia-drm
    # "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    # "WLR_NO_HARDWARE_CURSORS" = "1";
  };

  # Start Hyprland on TTY login
  programs.zsh.profileExtra = ''
    Hyprland
  '';
}

