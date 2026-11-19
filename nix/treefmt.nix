{harbor-meta}: _: {
  # This repository contains Nix infrastructure; downstream NTT projects
  # compose Rust, JavaScript and Solidity modules for their own sources.
  imports = [harbor-meta.treefmtModules.nix harbor-meta.treefmtModules.toml];
  projectRootFile = "flake.nix";
  settings.excludes = [".github/workflows/*.yaml"];
}
