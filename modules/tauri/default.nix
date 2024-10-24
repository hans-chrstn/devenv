{ pkgs }:
let
  libs = with pkgs; [
    webkitgtk_4_1
    gtk3
    cairo
    gdk-pixbuf
    glib
    dbus
    openssl_3
    librsvg
    wasmi
    pkg-config
    dbus
    openssl_3
    glib
    gtk3
    libsoup
    webkitgtk_4_1
    appimagekit
    librsvg
    rustc
    rustup
    nodejs_20
    cargo
    trunk
  ];

in pkgs.mkShell {
  buildInputs = libs;
  shellHook = ''
    export PYGAME_DETECT_AVX2=1
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libs}:$LD_LIBRARY_PATH
    export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS
  '';
}
