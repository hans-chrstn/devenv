{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    libGL
    glslang
    glfw-wayland
    glm
    shaderc
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
}
