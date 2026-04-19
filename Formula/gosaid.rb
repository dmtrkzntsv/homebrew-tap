class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.3/gosaid-0.1.3-darwin-arm64.tar.gz"
      sha256 "87eb79f997c7417da39da76c707f5b5cd2e2bed21dbebd2ce3741f366bdd9094"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.3/gosaid-0.1.3-darwin-amd64.tar.gz"
      sha256 "e318fc95761a1f9eed98df7ddb7642e20c7a0ee4eea7aa0b6b34090630482b63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.3/gosaid-0.1.3-linux-arm64.tar.gz"
      sha256 "1f88d0b07e630e55077145c83b0f407a689a66620190f5b78767ffa255591635"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.3/gosaid-0.1.3-linux-amd64.tar.gz"
      sha256 "914046da19d30fa9d4570ec0897ab56fc429017f51c761c2332ddf682d3b3d42"
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
