# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # home...
      ./system/home.nix
      ./cfg/vscodium/init.nix

      ./system/bootloader.nix
      ./system/env.nix
      ./system/internationalization.nix
      ./system/mounts.nix
      ./system/network.nix
      ./system/services.nix
      ./system/typography.nix
      ./system/user-packages.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
