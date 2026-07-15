{pkgs}: let
  cpp = import ../default.nix {inherit pkgs;};
in
  pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;} {
    buildInputs =
      cpp.buildInputs
      ++ (with pkgs; [
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
        tinyobjloader
        llvmPackages_latest.lldb
        llvmPackages_latest.libstdcxxClang
        llvmPackages_latest.libllvm
        llvmPackages_latest.libcxx
        valgrind
        clang
        tinyobjloader
        stb
        freetype
      ]);
    nativeBuildInputs = cpp.nativeBuildInputs ++ (with pkgs; []);
    shellHook = ''
      ${cpp.shellHook}
    '';
    LD_LIBRARY_PATH = "${pkgs.glfw-wayland}/lib:${pkgs.vulkan-loader}/lib:${pkgs.vulkan-validation-layers}/lib";
    VULKAN_SDK = "${pkgs.vulkan-headers}";
    VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
  }
