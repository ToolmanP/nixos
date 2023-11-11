{pkgs, term, ...}:
let 
  proxy_host = "127.0.0.1";
  proxy_port = "7890";
in
{
  programs.fish = {

    enable = true;
    
    shellAliases = {

      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -la";
      lg = "lazygit";
      gci = "git commit";
      gcl = "git clone";

    };

    shellInit = "
       set -U fish_greeting ''
       export LS_COLORS=(vivid generate catppuccin-${term.ls-color})
    ";

    functions = {
      set_proxy = {
        body = "export https_proxy=${proxy_host}:${proxy_port}
                export http_proxy=${proxy_host}:${proxy_port}";
      };
      set_proxy_w_http = {
        body = "export https_proxy=http://${proxy_host}:${proxy_port}
                export http_proxy=http://${proxy_host}:${proxy_port}";
      };
      reset_proxy= {
        body = "set -e http_proxy
                set -e https_proxy";
      };
    };
    plugins = [
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "master";
          sha256 = "nTiFD8vWjafYE4HNemyoUr+4SgsqN3lIJlNX6IGk+aQ=";
        };
      }
    ];
  };
}
