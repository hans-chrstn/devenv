{ pkgs }:

let
  rustShell = import ../default.nix {inherit pkgs;};
in 

pkgs.mkShell rec {
  buildInputs = rustShell.buildInputs ++ (with pkgs; [
      nodejs_latest
  ]);

  nativeBuildInputs = rustShell.nativeBuildInputs ++ (with pkgs; [
  ]);

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
}
