{ pkgs }:

let
  libs = with pkgs; [
    gtkmm4
    gtk4
    gcc
    pkg-config
    gdb
  ];
in pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
    cmake
    clang
    meson
    ninja
    cppcheck
    codespell
    conan
    doxygen
    gtest
    lcov
    vcpkg
    vcpkg-tool
    cargo
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
  CLANGD_PATH = "${pkgs.llvmPackages_latest.clang-tools}/bin/clangd";
}
