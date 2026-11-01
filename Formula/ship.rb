class Ship < Formula
  desc "Publish and run lab services from R2"
  homepage "https://github.com/dmtrkzntsv/ship"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.1/ship-v0.2.1-darwin-arm64.tar.gz"
      sha256 "e35903f34ca19a3324499091a8710096b49f53b266df2b00ddf29216f29eee27"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.1/ship-v0.2.1-darwin-amd64.tar.gz"
      sha256 "f5a770022f4c5daf2e3589d407ba2532687919956dbb318178154521b35d9782"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.1/ship-v0.2.1-linux-arm64.tar.gz"
      sha256 "310e2545b0a31ed572556d1739b43da9b9e1561a879906448892ebd7cb88d5cf"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.2.1/ship-v0.2.1-linux-amd64.tar.gz"
      sha256 "8011118acd2607e8567133f688db6e318cf5b81f5e037fe6b5197136c09c2db1"
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
