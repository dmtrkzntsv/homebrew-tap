class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.2/gosaid-0.3.2-darwin-arm64.tar.gz"
      sha256 "3f5375be5939c693d05340e07938cd3265b1aea48ac68d601ffe23998e10c4d0"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.2/gosaid-0.3.2-darwin-amd64.tar.gz"
      sha256 "3ffb86ade80dbe6334c305cb69feb430114b9642ff1c3978d1baf980992378cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.2/gosaid-0.3.2-linux-arm64.tar.gz"
      sha256 "891a85331de65c00a6c87a795456d6a9f66d8cd4a2d813931d593dbd8653b8c2"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.3.2/gosaid-0.3.2-linux-amd64.tar.gz"
      sha256 "95c4949dbc858ed52972d3fa1afdac810b1579348ba3d9f685a6dc868a26299d"
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
