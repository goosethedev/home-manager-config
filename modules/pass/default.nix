{ config, pkgs, lib, ... }:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass-wayland.withExtensions (exts: [ exts.pass-otp ]);
    settings = {
      PASSWORD_STORE_DIR = "$HOME/.password-store";
      PASSWORD_STORE_KEY = "goosethedev@proton.me";
      PASSWORD_STORE_CLIP_TIME = "60";
    };
  };
}
