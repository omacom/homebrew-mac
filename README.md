# Homebrew tap for Omarchy on Mac

```
brew install omacom/mac/omarchy
```

Or tap once, then use the short name:

```
brew tap omacom/mac
brew install omarchy
```

`omarchy` installs the Omarchy Installer app and opens it, the first step to running Omarchy on an Apple Silicon Mac (macOS 15 or later). Uninstalling the cask removes the app and its helper; it does not remove an Omarchy install. Use Remove Omarchy in the app for that.

The cask is bumped automatically: a workflow checks for a new installer release every hour (or when the installer repo dispatches `installer-released`) and opens a PR with the new version and checksum.
