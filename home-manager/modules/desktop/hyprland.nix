{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      "$Mod" = "SUPER";

      general ={
        gaps_in = 5;
        border_size = 3;
        "col.active_border" = "rgba(fba1b7ee) rgba(fff0f5dd) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {

        rounding = 10;

        blur = {
            enabled = true;
            size = 3;
            passes = 1;
        };

        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;

        "col.shadow" = "rgba(1a1a1aee)";

      };

      input = {

        kb_layout = "us";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = "0,2"; # -1.0 - 1.0, 0 means no modification.
      };
      

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = "-1";
      };

      animations = {
       enabled = true; 
       bezier = [
        "cubicBezier, 0.25, 1, 0.5, 1"
        "easeBezier, 0.34, 1.56, 0.64, 1"
       ];
       animation = [
          "windows, 1, 7, cubicBezier"
          "windowsIn, 1, 6, cubicBezier, slide"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, easeBezier"
       ];
      };


      windowrulev2 = [
        "float,class:(pcmanfm)"
        "float,class:(joshuto)"
        "float,class:(telegram)"
        "float,class:(imv)"
        "float,class:(mpv)"
      ];

      bind = [
        "$Mod, Return, exec, kitty" 
        "$Mod, Q, killactive"
        "$Mod, R, exec, rofi -show drun"
        "$Mod SHIFT, Q, exec, rofi -show power-menu -modi power-menu:$HOME/.config/rofi/power-menu"
        "$Mod SHIFT, S, exec, rofi -show spotlight -modi spotlight:$HOME/.config/rofi/spotlight"
        "$Mod, W, exec, rofi -show window"
        "$Mod, B, exec, firefox"
        "$Mod, H, movefocus, l"
        "$Mod, L, movefocus, r"
        "$Mod, left, workspace, e-1"
        "$Mod, right, workspace, e+1"
        "$Mod CTRL, left, workspace, -1"
        "$Mod CTRL, right, workspace, +1"
        "$Mod SHIFT, left, movetoworkspace, -1"
        "$Mod SHIFT, right, movetoworkspace, +1"
        "$Mod SHIFT, H, movewindow, mon:-1"
        "$Mod SHIFT, L, movewindow, mon:+1"
      ];

      bindm = [
        "$Mod, mouse:272, movewindow"
        "$Mod, mouse:273, resizewindow"
      ];

      exec-once = [
        "clash"
        "fcitx5"
        "waybar"
        "nm-applet"
        "swww-daemon"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

    };
  };
}
