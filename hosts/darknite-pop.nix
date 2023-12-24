{ config, pkgs, lib, ... }:

{
  imports = [
    # Main config
    ./common.nix
    
    # ../modules/vscode.nix
    # ../modules/eww/eww.nix
    # ../modules/kitty.nix
    ../modules/wezterm.nix
    # ../modules/pass.nix
  ];

  # For non NixOS systems
  targets.genericLinux.enable = true;

  # Local packages
  home.packages = with pkgs; [
    bitwarden
    gthumb
    neovim
    stremio
    # Doesn't open for some reason
    # zoom-us

    # For OpenGL programs e.g. kitty
    nixgl.nixGLIntel
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Set env vars
  home.sessionVariables = {
  };

  # Doesn't work. gpg-agent.conf doesn't get created and pinentry fails
  # Use the system one
  
  # programs.password-store = {
  #   enable = true;
  #   package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  #   settings = {
  #     PASSWORD_STORE_DIR = "$HOME/.password-store";
  #     PASSWORD_STORE_KEY = "goosethedev@proton.me";
  #     PASSWORD_STORE_CLIP_TIME = "60";
  #   };
  # };

  # programs.gpg = {
  #   enable = true;
  #   homedir = "${config.xdg.dataHome}/gnupg";
  # };

  # services.gpg-agent = {
  #   enable = true;
  #   pinentryFlavor = "qt";
  #   extraConfig = ''
  #     pinentry-program ${pkgs.pinentry-qt}
  #   '';
  # };
}
