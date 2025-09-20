{ pkgs }:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    alsa-lib-with-plugins
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    libxkbcommon
    gtk3
    gdk-pixbuf
    glib
    libxml2
    cairo
    pango
    fontconfig
    harfbuzz
    atk
  ];

  nativeBuildInputs = with pkgs; [
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
  '';
}
