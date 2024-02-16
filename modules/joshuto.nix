{ config, pkgs, lib, ... }:

{
  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
  programs.fzf.enable = true;
  programs.joshuto.enable = true;
}

