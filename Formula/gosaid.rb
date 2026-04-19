class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.4/gosaid-0.1.4-darwin-arm64.tar.gz"
      sha256 "abbf3ba2da5fcaa22138861d2fcfbe7d36cc077bf2a204d8d1d7904f8f0262ff"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.4/gosaid-0.1.4-darwin-amd64.tar.gz"
      sha256 "58a62de7ef19dad5dbc797a03372a9363c093e5803f1620b2b381b4fd13186b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.4/gosaid-0.1.4-linux-arm64.tar.gz"
      sha256 "ff06bf625a068d5df423b0571ce916ac31c189076d81810c0616385ee2f6341f"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.4/gosaid-0.1.4-linux-amd64.tar.gz"
      sha256 "3a4af86f50f498650599628d58773295a6b39e208838e77e5efcd01016bc9932"
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
