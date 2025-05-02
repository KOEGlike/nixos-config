{ config, pkgs, home-manager, ... }:
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.koeg = {pkgs, ...}:{
    programs.bash={
      enable = true;
      initExtra = ''
        if command -v tmux &> /dev/null && [ -z "$TMUX"]; then 
          tmux attach-session -t main || tmux new-session -s main
        fi
      '';
    };
    # The home.stateVersion option does not have a default and must be set
    home.stateVersion = "24.11";
    # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];
  };
}
