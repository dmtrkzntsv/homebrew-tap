class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "v0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/vv0.1.0/gosaid-v0.1.0-darwin-arm64.tar.gz"
      sha256 "3ba5ac4ef47570552e52f32d7e134b9431fc2601f6924b4187c0ac6031a1f53f"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/vv0.1.0/gosaid-v0.1.0-darwin-amd64.tar.gz"
      sha256 "75ee4204840e5a830d90b38e8902360ac0086b52283751e2441b9ee3f17db5a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/vv0.1.0/gosaid-v0.1.0-linux-arm64.tar.gz"
      sha256 "b42dbc276f8f327c9c6048bf7df1d375b73d5360f87386f111fa950e4eadcdfc"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/vv0.1.0/gosaid-v0.1.0-linux-amd64.tar.gz"
      sha256 "002e322a21807d6d0b31aa5b09441e6147258bf740576555400e6f6e98fc9f17"
    end
  end

  def install
    bin.install "gosaid"
  end

  service do
    run [opt_bin/"gosaid"]
    keep_alive true
    log_path var/"log/gosaid.log"
    error_log_path var/"log/gosaid.log"
  end

  def caveats
    <<~EOS
      Configure: gosaid config
      Run in background: brew services start gosaid

      macOS: grant Accessibility (for global hotkeys + paste) and Microphone
      on first use in System Settings -> Privacy & Security.

      Linux: install a keystroke-injection tool (wtype / xdotool / ydotool).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gosaid version")
  end
end
