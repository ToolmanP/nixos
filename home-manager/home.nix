{pkgs, ...}:
let 
  pypkgs = ps: with ps; [ requests pillow aiohttp numpy pandas gitpython ];
  tex = with pkgs; texlive.combined.scheme-medium;
in
{
  imports = [ 
            ./modules/term
            ./modules/desktop
            ./modules/vcs
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
       "electron-24.8.6"
      ];
    };
  };

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      imv
      mpv
      tex
      btop
      htop
      fish
      glow
      swww
      pypy3
      conda
      emacs
      dunst
      kitty
      typst
      pywal
      gitui
      vivid
      rizin
      rustup
      ranger
      logseq
      deluge
      nodejs
      ffmpeg
      httpie
      waybar
      bemenu
      zoxide
      pwndbg
      zathura
      pcmanfm
      lazygit
      pamixer
      joshuto
      obsidian
      starship
      nwg-look
      ropgadget
      wireshark
      wl-clipboard
      libreoffice
      eww-wayland
      pavucontrol
      go-musicfox
      microsoft-edge
      telegram-desktop
      firefox-devedition
      linux-wallpaperengine
      (python3.withPackages(pypkgs))
    ];
  };

}
