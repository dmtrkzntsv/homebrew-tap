class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.2.0/gosaid-0.2.0-darwin-arm64.tar.gz"
      sha256 "964aaee45e3a5ea120d750e790d8cacee14df00af083883d8b85d45437b833c3"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.2.0/gosaid-0.2.0-darwin-amd64.tar.gz"
      sha256 "7611e8c65957149938d0cc072fd6a72e131667943d008fa182aceef0cc3474de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.2.0/gosaid-0.2.0-linux-arm64.tar.gz"
      sha256 "6d49e9defba61c41e8d442d3f82aae11f6d6a33b2630ebcdca55c9ae8bc91070"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.2.0/gosaid-0.2.0-linux-amd64.tar.gz"
      sha256 "79e1d09810fb77976d3487514483f6665438d762da3eaa613cb654e642ee1171"
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
