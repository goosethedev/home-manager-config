{
  config,
  pkgs,
  ...
}: {
  # Basic info
  home.username = "goose";
  home.homeDirectory = "/home/goose";

  # Home manager release config style
  home.stateVersion = "23.05";

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Common modules for all distros and hosts
  imports = [
    ../modules/fcitx
    ../modules/git
    ../modules/joshuto
    ../modules/zsh
  ];

  # XDG configs (add .desktop path for HM packages)
  xdg.mime.enable = true;
  xdg.systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications"];

  # Services
  services.syncthing.enable = true;

  # Programs
  programs.direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages for all distros and hosts
  home.packages = with pkgs; [
    # Apps and utils
    onlyoffice-bin
    neofetch
    vlc
    wget

    # CLI tools (Rust!)
    bottom
    dua
    fd
    lsd
    ripgrep
    tealdeer
  ];
}
