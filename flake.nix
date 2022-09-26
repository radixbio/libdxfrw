{
  description = "A very basic flake";
  inputs = { flake-utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        libdxfrw = pkgs.stdenv.mkDerivation {
          pname = "libdx";
          version = "04-02-22";
          src = builtins.path {
            name = "libdxfrw";
            path = ./.;
          };
          nativeBuildInputs = [ pkgs.autoreconfHook ];
        };
      in {

        defaultPackage = libdxfrw;

      });
}
