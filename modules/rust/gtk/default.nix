{ pkgs }:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    rust-bin.stable.latest.default
    gtk4
    gobject-introspection
    glib
    pkg-config
  ];

  nativeBuildInputs = buildInputs;

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
    export ZSTD_SYS_USE_PKG_CONFIG="true";
  '';
}
