{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        numpy
        matplotlib
      ]))
  ];
  nativeBuildInputs = [];
  shellHook = '''';
}
