{
  config,
  pkgs,
  ...
}:

{
  imports = [
    # home...
    ./system/home.nix
    ./cfg/vscodium/init.nix
    ./cfg/neovim/init.nix
    ./cfg/bash/init.nix

    ./system/bootloader.nix
    ./system/env.nix
    ./system/internationalization.nix
    ./system/mounts.nix
    ./system/network.nix
    ./system/services.nix
    ./system/typography.nix
    ./system/user-packages.nix
    ./system/virtualization.nix

    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
