class Ship < Formula
  desc "Publish and run lab services from R2"
  homepage "https://github.com/dmtrkzntsv/ship"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.0/ship-v0.2.0-darwin-arm64.tar.gz"
      sha256 "335ccbc3969867fa8da4e66c69401f7fcc2ef3f268dff316f6135a151c938820"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.0/ship-v0.2.0-darwin-amd64.tar.gz"
      sha256 "02efed3ca9da142e3e504bd1a1e83580b25aa4247f54ab4a2438479884e42a49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.0/ship-v0.2.0-linux-arm64.tar.gz"
      sha256 "62225480b5fe1f3674a532dbba9e03471d8c07a4058c64f3cba7b2bfaaf17b9f"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.0/ship-v0.2.0-linux-amd64.tar.gz"
      sha256 "5155d19546fbe74b061912ebc29242c7074c817d6e658b6e50d3db01aad9ec34"
    end
  end

  def install
    bin.install "ship"
    generate_completions_from_executable(bin/"ship", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ship version")
  end
end
