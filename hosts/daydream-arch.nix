{ config, pkgs, lib, ... }:

{
  imports = [
    # Main config
    ./common.nix

    ../modules/vscode.nix
    ../modules/eww.nix
    ../modules/kitty.nix
    # ../modules/wezterm.nix
    ../modules/pass.nix
    ../modules/hyprland.nix
    ../modules/dunst.nix
    ../modules/fcitx5.nix
    ../modules/rofi.nix
    ../modules/xkb.nix
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # Local packages
  home.packages = with pkgs; [
    bitwarden
    discord
    gammastep
    grimblast
    gthumb
    lunatask
    neovim
    slack
    
    # For OpenGL programs e.g. kitty
    nixgl.auto.nixGLNvidia
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Override Nix kitty package with bin pointing to Arch local package that uses nixGLNvidia
    ".local/bin/kitty" = {
      enable = true;
      executable = true;
      text = "nixGLNvidia-545.29.06 /usr/bin/kitty";
      # TODO: Investigate how to do this
      # text = "${pkgs.nixgl.auto.nixGLNvidia} /usr/bin/kitty";
    };
  };

  # Set env vars
  home.sessionVariables = {
    # Hyprland variables
    # NixOS sets them automatically, Arch doesn't
    "LIBVA_DRIVER_NAME" = "nvidia";
    "XDG_SESSION_TYPE" = "wayland";
    # env = GBM_BACKEND,nvidia-drm
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
  };

  # Start Hyprland on TTY login
  programs.zsh.profileExtra = ''
    Hyprland
  '';
}

