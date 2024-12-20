{ pkgs }:

let
  libs = with pkgs; [
    gtkmm4
    gtk4
    llvmPackages_latest.libcxx
    llvmPackages_latest.llvm
    llvmPackages_latest.libcxxClang
    llvmPackages_latest.libcxxStdenv
    gcc
    pkg-config
    gdb
  ];
in pkgs.mkShell {
  buildInputs = libs;
  nativeBuildInputs = with pkgs; [
    bear
    cmake
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
    llvmPackages_latest.clang-tools
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
  CLANGD_PATH = "${pkgs.llvmPackages_latest.clang-tools}/bin/clangd";
  shellHook = ''
    export PKG_CONFIG_PATH=${pkgs.gtkmm4}/lib/pkgconfig:${pkgs.gtk4}/lib/pkgconfig
  '';
}
