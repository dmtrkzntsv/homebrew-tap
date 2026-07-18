class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "4.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v4.0.1/gosaid-4.0.1-darwin-arm64.tar.gz"
      sha256 "fe2b04c6817bb8d10bb444203cbfbd043a1db06c75ada7aecfd630da907ae335"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v4.0.1/gosaid-4.0.1-darwin-amd64.tar.gz"
      sha256 "e7db3d1864295046aac22392fb24158c26f471bb5182098c6b2178949abca989"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v4.0.1/gosaid-4.0.1-linux-arm64.tar.gz"
      sha256 "8392cb4d25ed1ce1b1bc9869998d88a75aaea0e24e89724968db9d84681c0a75"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v4.0.1/gosaid-4.0.1-linux-amd64.tar.gz"
      sha256 "d34318a594047be408d8d04f6c2ed80a0032dba4998971b53c58ae6743f6d743"
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
