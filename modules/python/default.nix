{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [ python313 ];
  nativeBuildInputs = [];
}
