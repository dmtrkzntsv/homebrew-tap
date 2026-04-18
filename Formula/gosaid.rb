class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.0/gosaid-0.1.0-darwin-arm64.tar.gz"
      sha256 "ad284091425fc6768900537599ee9290282aab6d1fba0bb85cb0ae27743b7058"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.0/gosaid-0.1.0-darwin-amd64.tar.gz"
      sha256 "b913041fba0e59c396f70ccd4d3b46d36acc61cf7b90b3e5c61807419e610611"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.0/gosaid-0.1.0-linux-arm64.tar.gz"
      sha256 "f2927fc1cea74bd762ae0c8567b00ce07e5513bc0f5ce8aba8ec3145f44afd3e"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.0/gosaid-0.1.0-linux-amd64.tar.gz"
      sha256 "9e504946149d448139629424a0f737a0083f25ba0f7969832b22ceaada51ffa3"
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
