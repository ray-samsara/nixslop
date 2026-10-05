{
  description = "i ripped this off from a guy named osman";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      spicetify-nix,
      nix-flatpak,
      nix4nvchad,
      ...
    }:
    
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit nix-vscode-extensions spicetify-nix nix4nvchad;
        };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          spicetify-nix.nixosModules.default
        ];
      };
    };
}
