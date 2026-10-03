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
      gnome-tweaks
    ];

    dconf.settings."org/gnome/shell".enabled-extensions = with pkgs; [
      gnomeExtensions.appindicator.extensionUuid
      gnomeExtensions.system-monitor.extensionUuid
      gnomeExtensions.user-themes.extensionUuid
    ];
  };
}
