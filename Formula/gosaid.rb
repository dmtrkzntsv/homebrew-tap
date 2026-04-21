class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.0/gosaid-0.3.0-darwin-arm64.tar.gz"
      sha256 "b3b0cd7619d83f0cd330e0029b1775049f42173be58944d273ca21fed212f6bb"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.0/gosaid-0.3.0-darwin-amd64.tar.gz"
      sha256 "f8bc24a0740551b4c1a4fc1e020d71bfc99f29918e01a5951c71626ea36960c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.0/gosaid-0.3.0-linux-arm64.tar.gz"
      sha256 "1f4b554cbe1f06c76c4f3be67b05887449d11fe572e6a959dc933f20cfed3006"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.0/gosaid-0.3.0-linux-amd64.tar.gz"
      sha256 "5fdf715f431faef96b3a01127641ad7bb6fc40d3a0f1982d5fd0920ccd20aa37"
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
