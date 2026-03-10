{pkgs}: let
  rustShell = import ../default.nix {inherit pkgs;};
in
  pkgs.mkShell rec {
    buildInputs =
      rustShell.buildInputs
      ++ (with pkgs; [
        gtk4
        gobject-introspection
        glib
        pango
        glib
        gdk-pixbuf
        gtk4-layer-shell
        luajit
        libpulseaudio
      ]);

    nativeBuildInputs =
      rustShell.nativeBuildInputs
      ++ (with pkgs; [
        ]);

    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
  }
