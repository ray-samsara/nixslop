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
      noto-fonts
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
        sansSerif = [ "pkgs.noto-fonts.noto-sans" ];
        serif = [ "pkgs.noto-fonts.noto-serif" ];
      };
    };
  };
}