# Homebrew tap for Omarchy on Mac

```
brew install omacom/mac/omarchy && open -b org.omarchy.installer
```

Or tap once and trust the cask, then use the short name:

```
brew tap omacom/mac
brew trust --cask omacom/mac/omarchy
brew install omarchy
open -b org.omarchy.installer
```

`omarchy` installs the Omarchy Installer app, the first step to running Omarchy on an Apple Silicon Mac (macOS 15 or later). The cask doesn't open the app. Run `open -b org.omarchy.installer`, or open it from your Applications folder. Uninstalling the cask removes the app and its helper; it does not remove an Omarchy install. Use Remove Omarchy in the app for that.

The cask is bumped automatically: a workflow checks for a new installer release every hour (or when the installer repo dispatches `installer-released`) and opens a PR with the new version and checksum.

To try it on a Mac that has the older `scottjones/tap` tapped, run `brew untap scottjones/tap` first.
