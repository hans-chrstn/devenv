{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [ (python3.withPackages (ps: with ps; [
  ])) ];
  nativeBuildInputs = [];
}
