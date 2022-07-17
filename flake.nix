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
        wasmTarget = "wasm32-unknown-unknown";
        ##
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
          target = wasmTarget;
        };
      in
      rec {
        devShell = with pkgs; mkShell {
          buildInputs = [
            wasm
            wabt
            (rust-bin.stable.${rustVersion}.default.override {
              targets = [ wasmTarget ];
            })
            cargo2nix.packages.${system}.default
          ];
        };

        packages = {
          rust-wasm = (rustPkgs.workspace.rust {}).bin;
        } // (let name = "rust-wasm-index"; in {
          # this circuitous formation is a somewhat contrived attempt to avoid
          # writing the same name twice. it works, but is perhaps confusing.
          ${name} = pkgs.stdenv.mkDerivation {
            inherit name;
            buildInputs = [];
            unpackPhase = "true";
            installPhase = ''
              mkdir $out
              cp ${./rust/index.html} $out/index.html
              cp ${packages.rust-wasm}/bin/rust.wasm $out/fizzbuzz.wasm
            '';
          };
        });
      });
}
