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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      spicetify-nix,
      ...
    }:
    
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit nix-vscode-extensions spicetify-nix;
        };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          spicetify-nix.nixosModules.default
        ];
      };
    };

    
}
