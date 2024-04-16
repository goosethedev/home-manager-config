{pkgs, ...}: {
  imports = [
    # Main config
    ./common.nix

    ../modules/vscode
    ../modules/wezterm
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # Local packages
  home.packages = with pkgs; [
    stremio

    # For OpenGL programs e.g. kitty
    nixgl.auto.nixGLDefault
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
  };
}
