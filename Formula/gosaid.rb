class Gosaid < Formula
  desc "Headless cross-platform push-to-talk voice dictation daemon"
  homepage "https://github.com/dmtrkzntsv/gosaid"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.5/gosaid-0.1.5-darwin-arm64.tar.gz"
      sha256 "deab53b297fcb971f934b31fc9a253ac6bc3b50dbda08e47a87dcdc12ead4049"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.5/gosaid-0.1.5-darwin-amd64.tar.gz"
      sha256 "dd55eb6f76da6e26658884f58005112c92f229b6a5552a1a60fc4da61de3ff1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.5/gosaid-0.1.5-linux-arm64.tar.gz"
      sha256 "1354a9411be12c75b8367eb6d618aef2582627e7d59eb5cc6db5835ed57ce2c0"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/gosaid/releases/download/v0.1.5/gosaid-0.1.5-linux-amd64.tar.gz"
      sha256 "28798d0ca59f8af5ac06c93675528ee3229ba6dfa52bdbff937401e79eba28d0"
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
