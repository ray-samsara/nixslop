{
  pkgs,
  ...
}:

{
  # fonts
  fonts =
  {
    enableDefaultPackages = true;

    packages = with pkgs; [
      adwaita-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      iosevka
    ];

    fontconfig =
    {
      enable = true;

      defaultFonts =
      {
        monospace = [ "pkgs.iosevka" ];
        sansSerif = [ "pkgs.adwaita-fonts.adwaita-sans" ];
        serif = [ "pkgs.noto-fonts.noto-serif" ];
      };
    };
  };
}