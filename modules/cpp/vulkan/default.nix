{pkgs}:
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
    stb
    gcc
    pkg-config
    gdb
    tinyobjloader
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

  shellHook = ''
    export VK_LAYER_PATH="${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d"
    echo "${pkgs.vulkan-validation-layers}"
    export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH:$XDG_DATA_DIRS"
    echo $XDG_DATA_DIRS
  '';
}
