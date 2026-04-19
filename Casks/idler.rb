cask "idler" do
  version "0.1.0"
  sha256 "9e5011dadba488d761199cc2dae747e90e2065d025947f4131f018e6c73cac09"

  url "https://github.com/dmtrkzntsv/idler2/releases/download/v0.1.0/Idler-#{version}.dmg"
  name "Idler"
  desc "Menu bar app that keeps your Mac awake"
  homepage "https://github.com/dmtrkzntsv/idler2"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Idler.app"

  zap trash: [
    "~/Library/Preferences/com.malikov.idler.plist",
    "~/Library/Saved Application State/com.malikov.idler.savedState",
  ]
end
