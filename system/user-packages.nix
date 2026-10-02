{
  pkgs,
  spicetify-nix,
  nix-vscode-extensions,
  ...
}:

{
  nixpkgs.overlays = [
    nix-vscode-extensions.overlays.default
  ];

  nixpkgs.config.allowUnfree = true;

  # user-specific packages
  users.users."pc" = {
    isNormalUser = true;
    description = "pc";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # uncomment and comment 'google-chrome' to use chromium instead
      # i use google chrome only because these chromium builds cannot sync my extensions
      #
      # chromium
      google-chrome
      discord
      vim
      fastfetch
      steam
      spotify

      # devel
      stdenv.cc
      gnumake
      cmake
      ninja 
      pkg-config
      autoconf
      automake
      libtool
      git
      gh

      # vscodium stuff
      (vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = with pkgs.nix-vscode-extensions.open-vsx; [
          jnoortheen.nix-ide
          icrawl.discord-vscode
          llvm-vs-code-extensions.vscode-clangd
          kylinideteam.cmake-intellisence
        ];
      })
    ];
  };

  # system packages
  environment.systemPackages = with pkgs; [
	  libdbusmenu-gtk3
    nixfmt
  ];

  # user: enable steam
  programs.steam.enable = true;

  # user: spotify shenanigans
  programs.spicetify =
    let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}