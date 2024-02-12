{ config, lib, pkgs, ... }:

{
  # Import LSPs
  imports = [
    ../lsp.nix
  ];

  programs.emacs = {
    enable = true;
  };

  # Enable daemon for clients
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  # Dependencies
  home.packages = with pkgs; [
    fd
    ripgrep
    cmake
    gnumake
    libtool
    shellcheck
  ];
  
}
