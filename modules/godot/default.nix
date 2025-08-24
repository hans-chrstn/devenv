{ pkgs }:
let
  libs = with pkgs; [
    dotnet-sdk_9
  ];
in
pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
    godot-mono
    aseprite
  ];
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  GODOT_FILE = "${pkgs.godot-mono}";
  shellHook = ''
      echo "To run godot with editor, do godot-mono -e"
      echo "To run aseprite, do aseprite"
      echo "To run VSCode, do code"
  '';
}
