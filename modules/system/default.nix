{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs) lib;
    inherit (lib) nixosSystem;
    inherit (lib.attrsets) recursiveUpdate;
    inherit (lib.lists) concatLists singleton;

    externalModules = [
      inputs.home-manager.nixosModules.default
    ];

    makeSystem = {
      hostname,
      system,
      ...
    } @ args:
      nixosSystem {
        modules = concatLists [
          (singleton {
            networking.hostName = args.hostname;
            nixpkgs.hostPlatform = args.system;
          })

          args.modules or []
        ];

        specialArgs = recursiveUpdate {
          inherit system self inputs;
        } (args.specialArgs or {});
      };
  in {
    DEV2DIE = makeSystem {
      hostname = "DEV2DIE";
      system = "x86_64-linux";
      modules = [
        ./boot
        ./services
        ./configuration.nix
      ];
    };
  };
}
