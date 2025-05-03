{ inputs, self, ... }:
let
  args = { inherit inputs self; };
in
{
  home-manager = {
    extraSpecialArgs = args;

    useGlobalPkgs = true;

    useUserPackages = true;

    users = {
      slydd = import ./slydd;
    };
  };
}
