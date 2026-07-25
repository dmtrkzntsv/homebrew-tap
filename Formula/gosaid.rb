class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.3/gosaid-0.5.3-darwin-arm64.tar.gz"
      sha256 "0f7ec3c502654d0776fd1f128e86bf597b6153b75b4549f72fd35aa3db872855"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.3/gosaid-0.5.3-darwin-amd64.tar.gz"
      sha256 "8ed490b22c1117e8ec23f51f9d7884ddd2aca1c46c704ca5be07161143843249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.3/gosaid-0.5.3-linux-arm64.tar.gz"
      sha256 "618cb9e7e2f2ef2cd1b8c24dc1936edb4667997e5eb869acae1e9458b7d3b0ba"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.5.3/gosaid-0.5.3-linux-amd64.tar.gz"
      sha256 "605ed5e603325f4572bd562d90bcd84c450017e3175596c420ba3d1887590611"
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
