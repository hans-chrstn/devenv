{pkgs}:
pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;} {
  buildInputs = with pkgs; [
    gcc
    pkg-config
    gdb
    llvmPackages_latest.lldb
    llvmPackages_latest.libstdcxxClang
    llvmPackages_latest.libllvm
    llvmPackages_latest.libcxx
    valgrind
    clang
  ];
  nativeBuildInputs = with pkgs; [
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
    clang-tools_19
    pandoc
  ];
  shellHook = ''
    export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH:$XDG_DATA_DIRS"
  '';
}
