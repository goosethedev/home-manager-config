{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # github.copilot
      catppuccin.catppuccin-vsc
      # vscodevim.vim
      esbenp.prettier-vscode
      pkief.material-icon-theme
      bbenoist.nix
    ];
    # userSettings = {
    # 	"workbench.sideBar.location" = "right";
    #   "workbench.colorTheme" = "Catppuccin Mocha";
    #   "catppuccin.accentColor" = "teal";
    #   "material-icon-theme.folders.color" = "#115989";
    #  };
  };
}
