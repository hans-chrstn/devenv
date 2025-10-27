{ pkgs }:
let
  libs = with pkgs; [
    dotnet-sdk_9
  ];

  godotAlias = pkgs.writeShellScriptBin "godot" ''
    exec ${pkgs.godot-mono}/bin/godot-mono "$@"
  '';
in
pkgs.mkShell {
  buildInputs =
    libs
    ++ (with pkgs; [
      godot-mono
      aseprite
      godotAlias
    ]);
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  DOTNET_ROOT = "${pkgs.dotnet-sdk_9}";
  GODOT_FILE = "${pkgs.godot-mono}";
  shellHook = ''
    echo "To run godot with project manager, do godot -p"
    echo "To run aseprite, do aseprite"
    echo "To run VSCode, do code"
  '';
}
