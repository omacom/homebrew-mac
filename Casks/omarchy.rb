cask "omarchy" do
  version "2.3.16"
  sha256 "0b70717b0bfa3277f41159b5de4a0cab9f75dda9ba64f13d4b4a02a7860dd027"

  url "https://github.com/omacom/omarchy-mac-installer/releases/download/v#{version}/Omarchy-Mac-Installer-#{version}.dmg"
  name "Omarchy Installer"
  desc "Installs Omarchy alongside macOS on Apple Silicon Macs"
  homepage "https://github.com/omacom/omarchy-mac-installer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Omarchy Installer.app"

  # The app installs a privileged helper with SMJobBless when it first asks
  # for an administrator password. Remove it with the app.
  uninstall launchctl: "org.omarchy.installer.helper",
            delete:    [
              "/Library/LaunchDaemons/org.omarchy.installer.helper.plist",
              "/Library/PrivilegedHelperTools/org.omarchy.installer.helper",
            ]

  zap trash: [
    "~/Library/Application Support/org.omarchy.installer",
    "~/Library/Caches/org.omarchy.installer",
    "~/Library/Preferences/org.omarchy.installer.plist",
    "~/Library/Saved Application State/org.omarchy.installer.savedState",
  ]

  # No auto-launch: postflight is deprecated, and postflight_steps runs sandboxed
  # and can't open apps through LaunchServices. The caveat opens the app by its
  # full path, which honours --appdir. `open -a "Omarchy Installer"` could pick
  # the Recovery copy bundled inside the app, which has the same name.
  caveats <<~EOS
    To set up Omarchy, open Omarchy Installer:
      open "#{appdir}/Omarchy Installer.app"

    Omarchy Installer sets up Omarchy next to macOS. It does not remove macOS.
    To remove Omarchy from this Mac later, open the app and choose Remove Omarchy
    before running `brew uninstall omarchy`.
  EOS
end
