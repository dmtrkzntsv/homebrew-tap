class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/gosaid/gosaid"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gosaid/gosaid/releases/download/v0.5.4/gosaid-0.5.4-darwin-arm64.tar.gz"
      sha256 "d8651a2a277e0e8c08f73f449edd4293462c73c8980ce6c619adcd670d045344"
    end
    on_intel do
      url "https://github.com/gosaid/gosaid/releases/download/v0.5.4/gosaid-0.5.4-darwin-amd64.tar.gz"
      sha256 "478fac06127a83e53eae8e64bd1d8d870350785137d1708d93acf3f534dcfe00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gosaid/gosaid/releases/download/v0.5.4/gosaid-0.5.4-linux-arm64.tar.gz"
      sha256 "e90adf3d8db08f8ab5a5e86fb936178390ef032e27697f4ab636002a5da815e9"
    end
    on_intel do
      url "https://github.com/gosaid/gosaid/releases/download/v0.5.4/gosaid-0.5.4-linux-amd64.tar.gz"
      sha256 "3e3d987e4240a7b3b86282b083f83cccde001138b0ca2f1445fa0851363620f6"
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
