{pkgs}: let
  godotAlias = pkgs.writeShellScriptBin "godot" ''
    exec ${pkgs.godotPackages_4_5.godot}/bin/godot-mono "$@"
  '';
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      godotPackages_4_5.godot
      aseprite
      godotAlias
    ];
    GODOT_FILE = "${pkgs.godotPackages_4_5.godot}";
    shellHook = ''
      echo "To run godot with project manager, do godot -p"
      echo "To run aseprite, do aseprite"
      echo "To run VSCode, do code"
    '';
  }
