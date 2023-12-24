{ config, pkgs, ...}:

{
  # Enable Japanese IME and MOZC
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
    ];
  };
}
