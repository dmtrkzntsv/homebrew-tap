class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.4.0/gosaid-0.4.0-darwin-arm64.tar.gz"
      sha256 "9c8295d3f963c516fc07081c8953f06af4220d08a8c5b59349cb8cad1dbf2b94"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.4.0/gosaid-0.4.0-darwin-amd64.tar.gz"
      sha256 "c674b0d226a157065c11a34e8beefe86d2ed51101f5dfd5c6da8730a1936eaae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.4.0/gosaid-0.4.0-linux-arm64.tar.gz"
      sha256 "bde186eb5ddc170f7b671ef88dc1447c3c4e996124567a22b542b881419bff31"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.4.0/gosaid-0.4.0-linux-amd64.tar.gz"
      sha256 "121dc63c8f924fe8559cedc7cb4f9f2b600a09e494544894702ffe6c78f5f07f"
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
