{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    kitty
    vivaldi
    zed-editor
    enpass
    git
    gh
  ];

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user = {
        email = "dayvidnavarrete@gmail.com";
        name = "slyddd";
      };
    };
  };
}
