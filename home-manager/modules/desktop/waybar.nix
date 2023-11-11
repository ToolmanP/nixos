{
  programs.waybar = {

    enable = true;

    settings = {

      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height =  0;

        modules-left  = [
          "clock"
          "hyprland/workspaces"
        ];
        modules-center = ["hyprland/window"];

        modules-right =  [
          "tray"
          "battery"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
        ];

        "hyprland/window" = {
            format = "{}";
        };

        "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
        };

       "custom/weather" =  {
            tooltip =  true;
            format  = "{}";
            interval =  30;
            exec =  "python ~/.config/waybar/scripts/waybar-wttr.py";
            return-type = "json";
        };

        tray = {
            icon-size = 13;
            spacing = 10;
        };

        clock = {
            format = "{: %R   %d/%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        backlight =  {
            device = "amd_backlight";
            format = "{icon} {percent}%";
            format-icons= ["󱋗"  ""  ""];
            on-scroll-up = "brightnessctl set 1%+";
            on-scroll-down = "brightnessctl set 1%-";
            min-length = 6;
        };

        battery= {
            states= {
                good= 95;
                warning = 30;
                critical = 20;
            };
            format = "{icon} {capacity}%";
            format-charging =  " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = ["" ""  ""  ""  ""  ""  ""  ""  ""  ""  ""];
        };

        pulseaudio= {
            format = "{icon} {volume}%";
            tooltip = false;
            format-muted = " Muted";
            on-click = "pamixer -t";
            on-scroll-up = "pamixer -i 5";
            on-scroll-down = "pamixer -d 5";
            scroll-step = 5;
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [""  ""  ""];
            };
        };

        "pulseaudio#microphone"= {
            format = "{format_source}";
            format-source = " {volume}%";
            format-source-muted = " Muted";
            on-click = "pamixer --default-source -t";
            on-scroll-up = "pamixer --default-source -i 5";
            on-scroll-down = "pamixer --default-source -d 5";
            scroll-step = 5;
            };
          };
      };

    style = ./themes/waybar/style.css;

  };

  home.file.".config/waybar/scripts" = {
    enable = true;
    recursive = true;
    source = ./scripts/waybar;
  };
}
