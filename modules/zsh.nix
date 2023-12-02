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
    dirHashes = {
      docs  = "$HOME/Documents";
      dl    = "$HOME/Downloads";
      pr    = "$HOME/Projects";
      temp  = "$HOME/Temp";
    };
    history = {
      ignoreAllDups = true;
      path = "$HOME/.cache/.zsh_history";
    };
    envExtra = ''
      export EDITOR=hx
      export LESSHISTFILE="$XDG_STATE_HOME"
      export GNUPGHOME="$HOME/.config/gnupg"
      export PATH="$HOME/.config/emacs/bin:$PATH"
    '';
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(direnv hook zsh)"
    '';
    shellAliases = {
      vim = "nvim";
      e = "exit";
    };
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.config/zsh/oh-my-zsh";
      plugins = [ "aliases" "git" ];
    };
  };
}
