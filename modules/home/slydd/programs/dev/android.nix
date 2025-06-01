{ pkgs, ... }:
let
  androidSdk = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "9.0";
    buildToolsVersions = [ "34.0.0" ];
    platformVersions = [ "34" ];
    ndkVersion = "23.1.7779620";
    includeEmulator = false;
    includeSystemImages = false;
  };
in
{
  home.packages = [
    androidSdk.androidsdk
  ];
}
