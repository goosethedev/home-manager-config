{pkgs, ...}: {
  # TODO: Traduce to programs.rofi ...
  home.packages = with pkgs; [
    rofi-wayland
  ];

  # Set files in ~/.config
  xdg.configFile."rofi".source = ./config;
}
