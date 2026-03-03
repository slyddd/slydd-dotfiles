{ inputs, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.slydd = import ./slydd;
    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "nixbak";
  };
}
