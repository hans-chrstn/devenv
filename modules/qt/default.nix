{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (python3.withPackages(ps: with ps; [
      pip
      pyside6
    ]))
    qt6.full
  ];

  shellHook = ''
    export QT_QPA_PLATFORM=wayland
  '';
}
