{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    (import ./plasma.nix { inherit config pkgs inputs; })
  ];

  home.username = "koeg";
  home.homeDirectory = "/home/koeg";

  programs.bash = {
    enable = true;
    initExtra = ''
      if command -v tmux &> /dev/null && [ -z "$TMUX"]; then 
        tmux attach-session -t main || tmux new-session -s main
      fi
    '';
  };

  home.stateVersion = "24.11";
}
