{ pkgs }:

let
  libs = with pkgs; [
    gcc
    gradle
    jdk
    maven
    ncurses
    patchelf
    zlib
  ];
in
pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
  ];
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  shellHook = ''
  '';
}
