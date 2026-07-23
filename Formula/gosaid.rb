class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.0/gosaid-0.5.0-darwin-arm64.tar.gz"
      sha256 "f8ccddd6970cc9667dcf71346f9afac43cfc6d09a736f52c3220aa4ae302a4b9"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.0/gosaid-0.5.0-darwin-amd64.tar.gz"
      sha256 "4066c733328f976e9b225c01182efcd82581a7be2f4dc46333b2714ae9e92a8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.0/gosaid-0.5.0-linux-arm64.tar.gz"
      sha256 "22f1b7ab4afd8d661f2cfdf78a5d251760f582112d5866cdbfd2b348f8f1bebd"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.0/gosaid-0.5.0-linux-amd64.tar.gz"
      sha256 "f2a3b47efa2ef39a6acdc1d010b3fe763e45cc4355c3b56f0deb53297a21df71"
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
