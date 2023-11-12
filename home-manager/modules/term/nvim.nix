{ pkgs, ... }:
let pypkg = ps: with ps; [ python-lsp-server autopep8 flake8 ];
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixfmt
      gopls
      stylua
      lua-language-server
      prettierd
      deno
      (python3.withPackages (pypkg))
    ];
  };
}
