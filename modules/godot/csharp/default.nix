{ pkgs }:

let
  libs = with pkgs; [
    omnisharp-roslyn
  ];
  godotShell = import ../default.nix {inherit pkgs; };
in
pkgs.mkShell rec {
  buildInputs = godotShell.buildInputs ++ libs;
  nativeBuildInputs = with pkgs; [
    aseprite
    godot-mono
  ];
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath buildInputs;
  DOTNET_ROOT = "${pkgs.dotnet-sdk_9}";
  shellHook = ''
  '';
}
