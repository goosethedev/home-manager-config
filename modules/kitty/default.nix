{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    settings = {
      enable_audio_bell = false;
    };
  };
}

