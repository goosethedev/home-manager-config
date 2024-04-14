{pkgs, ...}: {
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
    # ../modules/wezterm # Doesn't work
    ../modules/xkb
  ];

  # Local packages
  home.packages = with pkgs; [
    appimage-run # For running AppImages
    bitwarden
    discord
    element-desktop
    gammastep
    grimblast
    gthumb
    pcmanfm
    stremio
    ytui-music
    zotero_7
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
