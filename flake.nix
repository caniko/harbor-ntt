{
  description = "Reproducible Wormhole NTT development infrastructure for Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    harbor-meta = {
      url = "github:caniko/harbor-meta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    harbor-meta,
    treefmt-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = import ./lib {inherit harbor-meta;};
    treefmt = treefmt-nix.lib.evalModule pkgs (import ./nix/treefmt.nix {inherit harbor-meta;});
  in {
    inherit lib;

    checks.${system} =
      (import ./checks {inherit pkgs self;})
      // {formatting = treefmt.config.build.check self;};

    formatter.${system} = treefmt.config.build.wrapper;
  };
}
