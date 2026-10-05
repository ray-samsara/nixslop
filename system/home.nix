{
  pkgs,
  ...
}:

{
  home-manager.users.pc = {
    home.stateVersion = "26.05";

    home.packages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.system-monitor
      gnomeExtensions.user-themes
      gnomeExtensions.caffeine
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
    ];

    dconf.settings."org/gnome/shell".enabled-extensions = with pkgs; [
      gnomeExtensions.appindicator.extensionUuid
      gnomeExtensions.system-monitor.extensionUuid
      gnomeExtensions.user-themes.extensionUuid
      gnomeExtensions.caffeine.extensionUuid
      gnomeExtensions.dash-to-dock.extensionUuid
      gnomeExtensions.blur-my-shell.extensionUuid
    ];
  };
}
