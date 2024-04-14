{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      formulahendry.auto-rename-tag
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      vspacecode.vspacecode
      vscodevim.vim
      esbenp.prettier-vscode
      bradlc.vscode-tailwindcss
      ms-azuretools.vscode-docker
      bbenoist.nix
      # github.copilot  # Don't have sub

      # Missing (install manually)
      # steoates - Auto Import
      # dsznajder - ES7+ React Snippets
      # playwright - Playwright
    ];
    # userSettings = {
    # 	"workbench.sideBar.location" = "right";
    #   "workbench.colorTheme" = "Catppuccin Mocha";
    #   "catppuccin.accentColor" = "teal";
    #   "material-icon-theme.folders.color" = "#115989";
    #  };
  };
}
