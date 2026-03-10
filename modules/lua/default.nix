{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [lua-language-server];
  nativeBuildInputs = [];
}
