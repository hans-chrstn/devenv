{ pkgs }:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    rust-bin.stable.latest.default
    alsa-lib-with-plugins
    pipewire
    rust-analyzer
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

  shellHook = ''
  '';
}
