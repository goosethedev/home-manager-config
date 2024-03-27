{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Gus Sánchez";
    userEmail = "goosethedev@proton.me";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    # signing = {
    #   key = "goosethedev@proton.me";
    #   signByDefault = true;
    # };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
