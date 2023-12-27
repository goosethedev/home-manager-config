{ config, pkgs, lib, ... }:

{
  imports = [
    # Main config
    ./common.nix

    # ../modules/vscode.nix
    ../modules/eww/eww.nix
    ../modules/kitty.nix
    # ../modules/wezterm.nix
    ../modules/pass.nix
  ];

  # Local packages
  home.packages = with pkgs; [
    bitwarden
    gammastep
    grimblast
    gthumb
    neovim
    slack
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
  };

  # Start Hyprland on TTY login
  programs.zsh.profileExtra = ''
    Hyprland
  '';
}
