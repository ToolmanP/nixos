{ global, pkgs, ... }:
let pypkgs = ps: with ps; [ requests pillow aiohttp numpy pandas gitpython ];
in {
  imports = [ ./hardware-configuration.nix ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "electron-24.8.6" ];
    };
  };

  nix = {
    settings = {
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    };
  };

  boot = {
    loader = {
      systemd-boot = { enable = true; };
      efi = { canTouchEfiVariables = true; };
    };

    kernelPackages = with pkgs; linuxPackages_zen;
  };

  environment = {
    localBinInPath = true;
    systemPackages = with pkgs; [
      fd
      go
      bat
      zip
      vim
      curl
      wget
      zsh
      duf
      fzf
      git
      lsd
      gcc
      ghc
      llvm
      cmake
      ninja
      clash
      unzip
      p7zip
      procs
      clang
      ocaml
      pueue
      psmisc
      minicom
      python3
      gnumake
      powertop
      ripgrep
      du-dust
      neofetch
      libgnurl
      strongswan
      subversion
      zerotierone
      clang-tools
      virt-manager
      brightnessctl
      networkmanagerapplet
      (python3.withPackages(pypkgs))
    ];
  };

  networking = {
    hostName = "MetaNix";
    networkmanager = {
      enable = true;
      wifi = { backend = "iwd"; };
    };
  };

  services = {

    printing = { enable = true; };

    flatpak = { enable = true; };

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    xserver = {
      enable = true;
      layout = "us";
      libinput = { enable = true; };
      displayManager = {
        sddm = {
          enable = true;
          autoNumlock = true;
          wayland = { enable = true; };
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  powerManagement = {
    enable = true;
    powertop = { enable = true; };
    cpuFreqGovernor = "onDemand";
  };

  time = { timeZone = "Asia/Shanghai"; };

  security = { rtkit = { enable = true; }; };

  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-chinese-addons
        libsForQt5.fcitx5-qt
      ];
    };
    defaultLocale = "en_US.UTF-8";
  };

  programs = {
    hyprland = { enable = true; };
    mtr = { enable = true; };
    nix-ld = { enable = true; };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    dconf = { enable = true; };
  };

  users = {
    users = {
      ${global.profile.username} = {
        uid = 1000;
        isNormalUser = true;
        extraGroups =
          [ "audio" "video" "wheel" "docker" "networkmanager" "libvirtd" ];
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      source-han-mono
      source-han-serif
      source-code-pro
      font-awesome
      material-design-icons
      montserrat
      (nerdfonts.override {
        fonts = [ "FiraCode" "Hack" "AnonymousPro" "Inconsolata" ];
      })
    ];
  };

  virtualisation = {
    docker = { enable = true; };
    libvirtd = { enable = true; };
  };

  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ amdvlk libva-utils vaapiVdpau ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  system = {
    stateVersion = "23.05";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
  };
}
