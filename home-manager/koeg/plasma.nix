{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];
  programs.plasma = {
    enable = true;
    overrideConfig = false;
    workspace = {
      colorScheme = "BreezeDark";
      wallpaper = "/home/koeg/Pictures/moutain-1.jpg";
    };
    desktop.mouseActions.middleClick = null;
    panels = [
      {
        location = "bottom";
        alignment = "left";
        opacity = "translucent";
        floating = true;
        hiding = "autohide";
        lengthMode = "fit";
        screen = 0;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          {
            systemTray = {
              items = {
                # Do not show all items in the system tray
                showAll = false;

                shown = [
                  # Volume / Audio devices
                  "org.kde.plasma.volume"
                  # Network manager
                  "org.kde.plasma.networkmanagement"
                  # Current keyboard layout
                  "org.kde.plasma.keyboardlayout"
                  "org.kde.plasma.mediacontroller"
                ];

                hidden = [
                  # Printers
                  "org.kde.plasma.printmanager"
                  "org.kde.plasma.brightness"
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.battery"
                ];
              };
            };
          }
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

  };
}
