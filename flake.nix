{
  description = "Reproducible Wormhole NTT development infrastructure for Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    harbor-meta = {
      url = "github:caniko/harbor-meta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    harbor-meta,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = import ./lib {inherit harbor-meta;};
  in {
    inherit lib;

    checks.${system} = import ./checks {
      inherit pkgs self;
    };

    formatter.${system} = pkgs.alejandra;
  };
}
