{ pkgs }:

let
  rustShell = import ../default.nix {inherit pkgs;};
in 

pkgs.mkShell rec {
  buildInputs = rustShell.buildInputs ++ (with pkgs; [
    luajit
  ]);

  nativeBuildInputs = rustShell.nativeBuildInputs ++ (with pkgs; [
  ]);

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
}
