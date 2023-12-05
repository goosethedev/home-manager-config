{ config, pkgs, lib, ... }:

{
  # Basic info
  home.username = "goose";
  home.homeDirectory = "/home/goose";

  # Home manager release config style
  home.stateVersion = "23.05";

  imports = [
    ../modules/firefox.nix
    ../modules/git.nix
    ../modules/vscode.nix
    ../modules/emacs.nix
    ../modules/helix.nix

    # ../modules/eww/eww.nix
    ../modules/kitty.nix
    ../modules/zsh.nix
    ../modules/starship.nix
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # XDG configs (add .desktop path for HM packages)
  xdg.mime.enable = true;
  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

  # Enable discovering fonts in home.packages
  fonts.fontconfig.enable = true;

  # Local packages
  home.packages = with pkgs; [
    bitwarden
    gthumb
    obsidian
    onlyoffice-bin
    neovim
    neofetch
    spotify
    stremio
    vlc

    # Dependencies for Emacs
    fd
    ripgrep
    cmake
    gnumake
    libtool
    nixfmt
    shellcheck

    # For OpenGL programs e.g. kitty
    nixgl.nixGLNvidia

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Services
  services.syncthing.enable = true;

  # Programs
  programs.direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
