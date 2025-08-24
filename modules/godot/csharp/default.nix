{ pkgs }:

let
  libs = with pkgs; [
    omnisharp-roslyn
  ];
  godotShell = import ../default.nix {inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = godotShell.buildInputs ++ libs;
  nativeBuildInputs = godotShell.nativeBuildInputs ++ (with pkgs; [
  ]);
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
  DOTNET_ROOT = "";
  shellHook = ''
  '';
}
