{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # github.copilot
      catppuccin.catppuccin-vsc
      vscodevim.vim
      esbenp.prettier-vscode
      pkief.material-icon-theme
    ];
    userSettings = {
    	"workbench.sideBar.location" = "right";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "catppuccin.accentColor" = "teal";
      "material-icon-theme.folders.color" = "#115989";
     };
  };
}
