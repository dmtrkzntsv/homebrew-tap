class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.1/gosaid-0.5.1-darwin-arm64.tar.gz"
      sha256 "57b44db56bf86e00ecf4ec1fd6337a9afac959994adc00a2111b302cfec46534"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.1/gosaid-0.5.1-darwin-amd64.tar.gz"
      sha256 "7f74be5003bffe4c6034938f940355bc7035a8713f18d62b38f5ce7fce3e09bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.1/gosaid-0.5.1-linux-arm64.tar.gz"
      sha256 "6e513ac1167b3e8c75c4f004becb62c19eadd254c203fd57282f8ca7cfd99b8a"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.1/gosaid-0.5.1-linux-amd64.tar.gz"
      sha256 "665ffbb1f9a02e36adcca28155d1c1d305d5996475deb2b08a008107b8fb66e6"
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
