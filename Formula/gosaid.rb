class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.1/gosaid-0.1.1-darwin-arm64.tar.gz"
      sha256 "003ffc5aa1d7ecb1ed8c54245b55b915b50b4ddc183725ab753c6896bc38e0c8"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.1/gosaid-0.1.1-darwin-amd64.tar.gz"
      sha256 "44b1a84ebe9a435fb4dabff305b5b7d18c4a9e56923b8a74de4973bc6e4c60d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.1/gosaid-0.1.1-linux-arm64.tar.gz"
      sha256 "627c8e0076642357f02f608ebf29fe27b83fafab2f912e3c9ae48fa00c618910"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.1/gosaid-0.1.1-linux-amd64.tar.gz"
      sha256 "36835e988a2536fa2fc3b866e6e6f54dfae18abc5b58ba9c3ba9d7d0b6399e08"
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
