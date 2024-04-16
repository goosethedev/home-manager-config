{pkgs, ...}: {
  # TODO: Traduce to services.dunst ...
  home.packages = with pkgs; [
    rofi-wayland
  ];

  # Set files in ~/.config
  xdg.configFile."dunst".source = ./config;
}
