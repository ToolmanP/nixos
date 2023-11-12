{
  description = "Your new nix config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    systems = [
      "x86_64-linux"
    ];
    global = builtins.fromJSON(builtins.readFile ./global/config.json);
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {

    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/system;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      MetaNix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs global;};
        modules = [

          ./system/configuration.nix

          home-manager.nixosModules.home-manager 
          {
            home-manager = {
                users.${global.profile.username} = import ./home-manager/home.nix;
                extraSpecialArgs = global;
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
            };
          }

        ];
      };
    };

  };
}
