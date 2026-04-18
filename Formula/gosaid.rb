class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.2/gosaid-0.1.2-darwin-arm64.tar.gz"
      sha256 "25b6072d47bbbda415d32fa973e6e633e9cf0b1b0cd9e5b7da14d5cd383c3b10"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.2/gosaid-0.1.2-darwin-amd64.tar.gz"
      sha256 "fa551aa98b03740646c2fd3d8c27a669720ff835b0a71046a63940e769fc83ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.2/gosaid-0.1.2-linux-arm64.tar.gz"
      sha256 "3d32ec414e0ea84019af8a4cad3247733a8d6148d208b89e4ea1752a37fa6178"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.2/gosaid-0.1.2-linux-amd64.tar.gz"
      sha256 "4e60002261729db369242e153fbe585a665cbe080f83bf15b2259238fc8d177a"
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
