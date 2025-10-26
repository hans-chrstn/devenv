{ pkgs }:
let
  libs = with pkgs; [
    dotnet-sdk_9
  ];
in
pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
    godot
    aseprite
  ];
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  GODOT_FILE = "${pkgs.godot}";
  shellHook = ''
      echo "To run godot with editor, do godot -e"
      echo "To run aseprite, do aseprite"
      echo "To run VSCode, do code"
  '';
}
