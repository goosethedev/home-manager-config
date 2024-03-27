{ config, pkgs,  ... }:

{
  # Basic info
  home.username = "goose";
  home.homeDirectory = "/home/goose";

  # Home manager release config style
  home.stateVersion = "23.05";

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Common modules for all distros and hosts
  imports = [
    ../modules/firefox
    ../modules/fcitx
    ../modules/git
    ../modules/helix
    ../modules/joshuto
    ../modules/theme
    ../modules/zsh
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
    # Nixvim config package
    nixvim-custom
    
    # Apps
    obsidian
    onlyoffice-bin
    neofetch
    spotify
    vlc
    
    # System utils
    brightnessctl
    dunst
    hyprpaper
    playerctl
    rofi-wayland
    wget
    wl-clipboard
    xdg-utils

    # CLI tools
    bottom
    dua
    fd
    lsd
    ripgrep
    tealdeer
    
    # Fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    comic-mono
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
