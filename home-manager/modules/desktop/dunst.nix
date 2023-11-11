{desktop, pkgs, ...}:
let 
  theme = builtins.fromJSON(builtins.readFile ./themes/palette/${desktop.dunst.theme}.json);
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "30x50";
        origin = "top-right";
        sort = "yes";
        markup = "full";
        max_icon_size = 64;
        stack_duplicates = true;
        show_age_threshold = 60;
        show_indicators = "yes";
        frame_color = theme.purple;
        separator_color = "frame";
        word_wrap = "yes";
        title = "Dunst";
        class = "Dunst";
      };

      urgency_low = {
        background = theme.background;
        foreground = theme.foreground;
      };

      urgency_normal = {
        background = theme.background;
        foreground = theme.foreground;
      };

      urgency_critical = {
        background = theme.background;
        foreground = theme.foreground;
        frame_color = theme.brightRed;
      };

    };
  };
}
