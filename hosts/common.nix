{ config, pkgs, lib, ... }:

{
  # Basic info
  home.username = "goose";
  home.homeDirectory = "/home/goose";

  # Home manager release config style
  home.stateVersion = "23.05";

  # Common modules for all distros and hosts
  imports = [
    ../modules/zsh.nix
    ../modules/firefox.nix
    ../modules/git.nix
    ../modules/japanese-fcitx.nix
    ../modules/emacs/emacs.nix
    ../modules/helix.nix
  ];
  
  # XDG configs (add .desktop path for HM packages)
  xdg.mime.enable = true;
  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

  # Enable discovering fonts in home.packages
  fonts.fontconfig.enable = true;

  # Services
  services.syncthing.enable = true;

  # Programs
  programs.direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages for all distros and hosts
  home.packages = with pkgs; [
    appimage-run # For running AppImages
    htop
    obsidian
    onlyoffice-bin
    neofetch
    spotify
    vlc
    
    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
