{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs) lib;
    inherit (lib) nixosSystem;
    inherit (lib.attrsets) recursiveUpdate;
    inherit (lib.lists) concatLists flatten singleton;

    # Core modules from external inputs
    nixosModules = [
      inputs.home-manager.nixosModules.default
    ];

    hostname = "DEV2DIE";
    system = "x86_64-linux";

  in {
    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
        ./configuration.nix
      ];
    };
  };
}
