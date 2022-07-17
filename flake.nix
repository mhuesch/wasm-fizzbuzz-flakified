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
        rustVersion = "1.61.0";
        overlays = [
          rust-overlay.overlays.default
          cargo2nix.overlays.default
        ];
        pkgs = import nixpkgs {
          inherit overlays system;
        };
        rustPkgs = pkgs.rustBuilder.makePackageSet {
          inherit rustVersion;
          packageFun = import ./rust/Cargo.nix;
        };
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            wasm
            wabt
            (rust-bin.stable.${rustVersion}.default.override {
              targets = [ "wasm32-unknown-unknown" ];
            })
            cargo2nix.packages.${system}.default
          ];
        };

        packages = rec {
          rust-wasm = (rustPkgs.workspace.rust {}).bin;
          default = rust-wasm;
        };
      });
}
