{harbor-meta}: _: {
  # This repository contains Nix infrastructure; downstream NTT projects
  # compose Rust, JavaScript and Solidity modules for their own sources.
  imports = [
    harbor-meta.treefmtModules.nix
    harbor-meta.treefmtModules.toml
    harbor-meta.treefmtModules.markdown
    harbor-meta.treefmtModules.shell
    harbor-meta.treefmtModules.svg
  ];
  projectRootFile = "flake.nix";
  settings.excludes = [".github/workflows/*.yaml"];
}
