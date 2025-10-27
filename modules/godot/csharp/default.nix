{ pkgs }:

let
  libs = with pkgs; [
    omnisharp-roslyn
  ];
  godotShell = import ../default.nix { inherit pkgs; };
in
pkgs.mkShell {
  inherit (godotShell) shellHook nativeBuildInputs;
  buildInputs = godotShell.buildInputs ++ libs;
  DOTNET_ROOT = "${pkgs.dotnet-sdk_9}";
}
