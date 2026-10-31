class Ship < Formula
  desc "Publish and run lab services from R2"
  homepage "https://github.com/dmtrkzntsv/ship"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.1.0/ship-v0.1.0-darwin-arm64.tar.gz"
      sha256 "49b526181b83fdc00da405513786b95fcd42f529c891b72d3b49e4f3e1b7ed15"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.1.0/ship-v0.1.0-darwin-amd64.tar.gz"
      sha256 "11f31e4733066783395f54f166a03ac74a9705d2dee0cae1257e06e87a15f28a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.1.0/ship-v0.1.0-linux-arm64.tar.gz"
      sha256 "44f82d33467db753638e2976ee4ac78943ae884b344b0979c86a07c7175ebac0"
    end
    on_intel do
      url "https://github.com/dmtrkzntsv/ship/releases/download/v0.1.0/ship-v0.1.0-linux-amd64.tar.gz"
      sha256 "5ec851edbcdc9b60637d5275f081a73127bb1712748df853562674051d238c3d"
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
