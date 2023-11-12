{ pkgs, ... }:
let
  wayland-opts =
    "--enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --enable-wayland-ime";

in {
  xdg.desktopEntries = {

    "Visual Studio Code(wayland)" = {
      name = "Visual Studio Code(Wayland)";
      actions = {
        new-empty-window = {
          name = "New Empty Window";
          icon = "vscode";
          exec = "code ${wayland-opts} --new-window %F";
        };
      };
      categories = [ "Utility" "TextEditor" "Development" "IDE" ];
      comment = "Code Editing. Refined.";
      exec = "code ${wayland-opts} %F";
      icon = "vscode";
      genericName = "Text Editor";
      mimeType = [ "text/plain" "inode/directory" ];
      startupNotify = true;
      settings = { StartupWMClass = "Code"; };
    };

    "Logseq(wayland)" = {
      name = "Logseq (Wayland)";
      exec = "logseq ${wayland-opts} %u";
      icon = "logseq";
      comment =
        "A privacy-first, open-source platform for knowledge management and collaboration.";
      startupNotify = true;
      categories = [ "Utility" ];
      settings = { StartupWMClass = "Logseq"; };
    };

    "Microsoft Edge(wayland)" = {
      name = "Microsoft Edge (Wayland)";
      exec = "microsoft-edge-stable ${wayland-opts} %U";
      startupNotify = true;
      icon = "microsoft-edge";
      categories = [ "Network" "WebBrowser" ];
      mimeType = [
        "application/pdf"
        "application/rdf+xml"
        "application/rss+xml"
        "application/xhtml+xml"
        "application/xhtml_xml"
        "application/xml"
        "image/gif"
        "image/jpeg"
        "image/png"
        "image/webp"
        "text/html"
        "text/xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
      ];
    };
  };
}
