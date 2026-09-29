{pkgs}: let
  llvm = pkgs.llvmPackages_23;
in
  pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;}
  {
    buildInputs = [
      pkgs.gcc
      pkgs.pkg-config
      pkgs.gdb
      llvm.lldb
      llvm.libstdcxxClang
      llvm.libllvm
      llvm.libcxx
      pkgs.valgrind
      pkgs.just
      llvm.clang
      pkgs.catch2_3
    ];
    nativeBuildInputs = [
      pkgs.cmake
      pkgs.meson
      pkgs.ninja
      pkgs.cppcheck
      pkgs.codespell
      pkgs.conan
      pkgs.doxygen
      pkgs.gtest
      pkgs.lcov
      pkgs.vcpkg
      pkgs.vcpkg-tool
      pkgs.cargo
      llvm.clang-tools
      pkgs.pandoc
    ];
    shellHook = ''
      export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH:$XDG_DATA_DIRS"
    '';
  }
