{pkgs, common, ...}:
{
  gtk = {
    enable = true;
    font = {
      name = "Noto Sans CJK SC";
      size = 11;
    };
    cursorTheme = {
      package = with pkgs; bibata-cursors;
      name = common.cursor;
      size = 16;
    };
    iconTheme = {
      package = with pkgs; dracula-icon-theme;
      name = common.icon;
    };
    theme = {
      package = with pkgs; dracula-theme;
      name = common.theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
