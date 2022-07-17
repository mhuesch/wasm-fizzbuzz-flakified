{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    cargo2nix.url = "github:cargo2nix/cargo2nix";
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, cargo2nix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [
          rust-overlay.overlays.default
          cargo2nix.overlays.default
        ];
        pkgs = import nixpkgs {
          inherit overlays system;
        };
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            wasm
            wabt
            (rust-bin.stable."1.61.0".default.override {
              targets = [ "wasm32-unknown-unknown" ];
            })
            cargo2nix.packages.${system}.default
          ];
        };
      });
}
