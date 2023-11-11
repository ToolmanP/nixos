{desktop, ...}:
let
  theme = desktop.kitty.theme;
in
{
  programs.kitty = {

    enable = true;

    font = {
      name = "FireCode Nerd Font Mono";
      size = 11;
    };

    settings = {
      disable_ligatures = "never";
      background_opacity = "0.85"; 
      window_padding_width = "3";
      enable_audio_bell = "no";
      enabled_layouts = "tall:bias=50,fat";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      shell = "fish";
      editor = "lvim";
    };

    keybindings = {
      "kitty_mod+enter" = "new_window";
      "kitty_mod+alt+enter" = "new_window_with_cwd";
      "ctrl+down" = "resize_window narrower";
      "ctrl+up" = "resize_window wider";
      "shift+left" = "move_window right";
      "shift+right" = "move_window left";
    };

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    extraConfig = builtins.readFile ./themes/kitty/frappe.conf;

  };

  home.file.".config/kitty/tab_bar.py" = {
    enable = true;
    source = ./scripts/kitty/tab_bar.py;
  };

}
