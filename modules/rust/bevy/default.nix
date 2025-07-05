{ pkgs }:

let
  rustShell = import ../default.nix {inherit pkgs; };
in

pkgs.mkShell rec {
  buildInputs = rustShell.buildInputs ++ (with pkgs; [
    udev
    alsa-lib-with-plugins
    vulkan-loader
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    libxkbcommon
    wayland
  ]);

  nativeBuildInputs = rustShell.nativeBuildInputs ++ (with pkgs; [
    aseprite
  ]);

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
  '';
}
