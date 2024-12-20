{ pkgs }:
let
  libs = with pkgs; [
    libGL
    glfw
    glew
    mesa
    glm
    llvmPackages_latest.libcxx
    llvmPackages_latest.llvm
    llvmPackages_latest.libcxxClang
    llvmPackages_latest.libcxxStdenv
    gcc
    pkg-config
    gdb
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL2_sound
    SDL2_gfx
    SDL2_net
    SDL2_Pango
  ];
in
pkgs.mkShell {
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
    pkg-config
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
  CLANGD_PATH = "${pkgs.llvmPackages_latest.clang-tools}/bin/clangd";
}

