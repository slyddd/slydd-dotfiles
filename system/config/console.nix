{ pkgs, ... }:
{
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v14n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
}
