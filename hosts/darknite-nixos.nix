{pkgs, ...}: {
  imports = [
    # Main config
    ./common.nix

    # Modules
    ../modules/firefox
    ../modules/helix
    ../modules/hyprland
    ../modules/kitty
    ../modules/pass
    ../modules/vscode
    # ../modules/wezterm # Doesn't work
    ../modules/xkb
  ];

  # Local packages
  home.packages = with pkgs; [
    appimage-run # For running AppImages

    # Electron apps
    bitwarden
    discord
    element-desktop
    obsidian
    spotify
    stremio
    zotero_7

    # Nixvim config package
    nixvim-custom

    # Temporal while project
    geckodriver
    chromedriver
    google-chrome
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # };

  # Set env vars
  # home.sessionVariables = {
  # };

  # Start Hyprland on TTY login
  programs.zsh.profileExtra = ''
    Hyprland
  '';
}
