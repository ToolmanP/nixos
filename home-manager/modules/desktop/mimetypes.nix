{
  xdg.mimeApps = {
    enable = true;
    associations = { added = { "inode/directory" = [ "joshuto.desktop" ]; }; };
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "inode/directory" = "pcmanfm.desktop";
      "x-scheme-handler/terminal" = "kitty.desktop";
    };
  };
}
