class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.2/gosaid-0.5.2-darwin-arm64.tar.gz"
      sha256 "dc7ef51aeb86355ac4877accaf61c915f0a0bf597aa71336dbea0759b4a2d205"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.2/gosaid-0.5.2-darwin-amd64.tar.gz"
      sha256 "0559cfb2b6c0ea2ed702ecdc27d6ca4ee5125c23dc467a19267fb920d1c50bc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.2/gosaid-0.5.2-linux-arm64.tar.gz"
      sha256 "a873c95aec7c2cb408c5459285a7de86e13defa8366c2dc689cd33c9764c5f6b"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.2/gosaid-0.5.2-linux-amd64.tar.gz"
      sha256 "f6ef1ceecc88ce8d4e5ecbb6339f2e5cf600a8a0defec68ed3d50895e0fcda56"
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
