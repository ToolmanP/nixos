{ pkgs, ... }: {
  home.desktopEntries = {

    "Visual Studio Code(wayland)" = {
      name = "Visual Studio Code(wayland)";
      actions = {
        new-empty-window = {
          name = "New Empty Window";
          icon = "vscode";
          exec = "code --new-window %F";
        };
      };
      categories = [ "Utility" "TextEditor" "Development" "IDE" ];
      comment = "Code Editing. Refined.";
      exec = "code %F";
      icon = "vscode";
      genericName = "Text Editor";
      mimeType = [ "text/plain" "inode/directory" ];
      startupNotify = true;
      settings = { StartupWMClass = "Code"; };
    };

  };
}
