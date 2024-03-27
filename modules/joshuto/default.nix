{ config, pkgs, lib, ... }:

{
  programs.joshuto.enable = true;

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };

  programs.fzf.enable = true;
}

