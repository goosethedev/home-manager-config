{
  config,
  pkgs,
  ...
}: {
  # TODO: None of this works yet
  home.packages = with pkgs; [
    catppuccin-kde
    catppuccin-kvantum
    catppuccin-cursors.mochaTeal
    libsForQt5.qtstyleplugin-kvantum
  ];

  # Catppuccin Mocha for GTK (working!)
  gtk = {
    enable = true;
    # https://github.com/catppuccin/gtk
    theme = {
      name = "Catppuccin-Mocha-Compact-Teal-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["teal" "mauve"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "mocha";
      };
    };

    # https://discourse.nixos.org/t/how-to-overwrite-catppuccin-papirus-folders/29121
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "teal";
      };
    };
  };

  # Now symlink the `~/.config/gtk-4.0/` folder declaratively:
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  # Doesn't work (?)
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
}
