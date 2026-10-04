{
  pkgs,
  ...
}:

{
  services.xserver.enable = true;

  # guh nome
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  # gnome: install games and core apps
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = true;

  # gnome: xdg desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  # flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = false;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}