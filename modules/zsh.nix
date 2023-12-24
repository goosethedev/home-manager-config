{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    # completionInit = ''
    # ''
    # Don't know what this do
    # dirHashes = {
    #   docs  = "$HOME/Documents";
    #   dl    = "$HOME/Downloads";
    #   pr    = "$HOME/Projects";
    #   temp  = "$HOME/Temp";
    # };
    history = {
      ignoreAllDups = true;
      path = "$HOME/.cache/.zsh_history";
    };
    envExtra = ''
      export EDITOR=hx
      export LESSHISTFILE="$HOME/.local/state"
      export GNUPGHOME="$HOME/.config/gnupg"
      export PATH="$HOME/.config/emacs/bin:$PATH"
    '';
    initExtra = ''
      eval "$(direnv hook zsh)"
    '';
    shellAliases = {
      vim = "nvim";
      e = "exit";
    };
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.config/zsh/oh-my-zsh";
      plugins = [ "aliases" "git" "starship" ];
    };
  };

  # Enable Starship shell
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

}
