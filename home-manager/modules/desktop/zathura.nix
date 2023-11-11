{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      recolor = false;
    };
    extraConfig = builtins.readFile ./rcfiles/zathura/zathurarc;
  };
}
