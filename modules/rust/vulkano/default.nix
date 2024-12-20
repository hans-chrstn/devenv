{ pkgs }:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    libGL
    SDL2
    SDL2_ttf
    SDL2_mixer
    SDL2_image
    SDL2_sound
    SDL2_gfx
    SDL2_net
    glslang
    mesa
    renderdoc
    spirv-tools
    vulkan-volk
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-validation-layers
    vulkan-tools-lunarg
    vulkan-extension-layer
    gcc
    pkg-config
    gdb
    rust-bin.stable.latest.default
    fontconfig
  ];
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
    clang-tools_18
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
}
