cask "thetap" do
  version "1.0.0-beta.1"
  sha256 "1f4e154791e8d0840217bbf7516d6dce9f8936ad9d6f9a343cb2a32f628a4dd1"

  url "https://github.com/muunleit-projects/TheTap/releases/download/v#{version}/TheTap-#{version}.zip"
  name "TheTap"
  desc "Menüleisten-App, die veraltete Homebrew-Pakete meldet"
  homepage "https://github.com/muunleit-projects/TheTap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "TheTap.app"

  uninstall quit: "io.github.muunleit-projects.thetap"

  zap trash: [
    "~/Library/Logs/TheTap",
    "~/Library/Preferences/io.github.muunleit-projects.thetap.plist",
  ]

  caveats <<~EOS
    TheTap ist ad hoc signiert und nicht notarisiert. macOS blockiert die App
    beim ersten Start. Freigabe: Systemeinstellungen → Datenschutz & Sicherheit
    → „Dennoch öffnen“.
  EOS
end
