{ pkgs }:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    alsa-lib
    libxkbcommon
    zstd
    wayland
    vulkan-loader
    wayland-protocols
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    udev
    rust-bin.stable.latest.default
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
    lldb
    aseprite
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
    export ZSTD_SYS_USE_PKG_CONFIG="true";
  '';
}
