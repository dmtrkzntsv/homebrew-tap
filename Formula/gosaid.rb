class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.1/gosaid-0.3.1-darwin-arm64.tar.gz"
      sha256 "d1047173d76407201c73a778d6e874ea560c7c56b6137363b3d6e7b956dc95ef"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.1/gosaid-0.3.1-darwin-amd64.tar.gz"
      sha256 "d2d9d0b7b3b41af35511041a3239d1f88fb0b3616c4906ee2c88817013681bb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.1/gosaid-0.3.1-linux-arm64.tar.gz"
      sha256 "aac1f73498ab63d33e2baaeeb7f3146a80122123fb7b8c262dac3023c522a62d"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.1/gosaid-0.3.1-linux-amd64.tar.gz"
      sha256 "506f1459d729b20040673f58c64a8842708a15ac93521a8044d0c9208288cdd3"
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
