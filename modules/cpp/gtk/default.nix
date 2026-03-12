{pkgs}: let
  cpp = import ../default.nix {inherit pkgs;};
in
  pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;} {
    buildInputs =
      cpp.buildInputs
      ++ (with pkgs; [
        gtkmm4
        gtk4
        gtk4-layer-shell
      ]);
    nativeBuildInputs = cpp.nativeBuildInputs ++ (with pkgs; []);
    LD_LIBRARY_PATH = "${pkgs.gtkmm4}/lib:${pkgs.gtk4}/lib";
    PKG_CONFIG_PATH = "${pkgs.gtkmm4}/lib/pkgconfig:${pkgs.gtk4}/lib/pkgconfig";
    shellHook = ''
      ${cpp.shellHook}
    '';
  }
