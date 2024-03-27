{ config, pkgs, lib, ... }:

{
  # Set files in ~/.config
  xdg.configFile."fcitx5".source = ./config;

  # Enable Japanese IME and MOZC
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
    ];
  };
}


