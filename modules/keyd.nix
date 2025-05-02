{ config, pkgs, ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(meta, esc)";
            esc = "overload(esc, capslock)"; # This doesn't work the way I expect it to, was just trying it out. The above line does work though.
          };
        };
      };
    };
  };
}
