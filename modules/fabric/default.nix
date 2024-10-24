{ pkgs }:

let
  libs = with pkgs; [
    flite.lib
    alsa-lib
    libpulseaudio
    glfw
    openal
    libGL
    glfw-wayland-minecraft
    kotlin
    jetbrains.jdk
  ];
in 
pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
    jetbrains.idea-community
    aseprite
    blockbench
  ];
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  shellHook = ''
    echo "Idea: ${pkgs.jetbrains.idea-community}"
    echo "Aseprite: ${pkgs.aseprite}"
    echo "Blockbench: ${pkgs.blockbench}"
  '';
}
