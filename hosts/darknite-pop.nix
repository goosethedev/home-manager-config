{pkgs, ...}: {
  imports = [
    # Main config
    ./common.nix
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # Local packages
  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
  };
}
