{pkgs, ...}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    theme = ./themes/rofi/spotlight-dark.rasi;
    font = "Droid Sans Hack Nerd Mono 12";
    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Dracula";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run =  "   Run ";
      display-window =  "   Window";
      display-Network = " 󰤨  Network";
      sidebar-mode =  false;
    };
  };

  home.file.".config/rofi/power-menu" = {
    enable = true;
    source = ./scripts/rofi/rofi-power-menu/rofi-power-menu;
    executable = true;
  };

  home.file.".config/rofi/spotlight" = {
    enable = true;
    source = ./scripts/rofi/rofi-spotlight/rofi-spotlight.sh;
    executable = true;
  };
}
