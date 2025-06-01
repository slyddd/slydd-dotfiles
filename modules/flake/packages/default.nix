{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        lightctl = pkgs.callPackage ./light.nix { };
        networkctl = pkgs.callPackage ./network.nix { };
        volumectl = pkgs.callPackage ./audio.nix { };
        cliphist-fuzzel = pkgs.callPackage ./cliphistory.nix { };
      };
    };
}
