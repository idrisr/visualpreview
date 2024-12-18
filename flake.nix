{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { devenv, nixpkgs, flake-utils, pre-commit-hooks, ... }@inputs:
    let
      system = flake-utils.lib.system.x86_64-linux;
      pkgs = nixpkgs.legacyPackages.${system};
      visualpreview = pkgs.callPackage ./visualpreview.nix { };
      hooks = {
        beautysh.enable = true;
        deadnix.enable = true;
        latexindent.enable = true;
        nixfmt.enable = true;
      };
    in {
      overlays.visualpreview = _: prev: {
        visualpreview = prev.callPackage ./visualpreview.nix { };
      };
      packages.${system} = { default = visualpreview; };
      devShells.${system} = {
        default = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [{ pre-commit.hooks = hooks; }];
        };
      };

      checks.${system} = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          inherit hooks;
        };
      };
    };
}
