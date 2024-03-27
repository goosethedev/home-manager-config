{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./gitui.nix
  ];
}
