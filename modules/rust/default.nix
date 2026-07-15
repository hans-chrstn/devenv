{pkgs}:
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    (rust-bin.stable.latest.default.override {
      extensions = ["rust-src" "rust-analyzer"];
    })
    alsa-lib
    alsa-plugins
    pipewire
    openssl
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
  ALSA_PLUGIN_DIRS = "${pkgs.alsa-plugins}/lib/alsa-lib";
  ALSA_CONFIG_PATH = "${pkgs.writeText "asound.conf" ''
    <${pkgs.alsa-lib}/share/alsa/alsa.conf>

    pcm.pipewire { type pulse }
    ctl.pipewire { type pulse }
    pcm.!default{
      type pulse
      hint.description "Default Audio Device (via PulseAudio/PipeWire)"
    }
    ctl.!default {
      type pulse
    }
  ''}";

  shellHook = ''
  '';
}
