# Wikilayer Homebrew tap

Install Wikilayer on macOS with Homebrew. The formula installs PostgreSQL 16 as a dependency and Wikilayer manages a separate database cluster automatically. Docker is not needed.

```sh
brew tap wikilayer/tap
brew install wikilayer/tap/wikilayer
brew services start wikilayer/tap/wikilayer
open http://127.0.0.1:8081
```

For a single-command install and service start, download the [Brewfile](Brewfile) and run `brew bundle --file Brewfile`. Check the file before running it.

The service listens only on `127.0.0.1:8081`. Its database and uploads live in `$(brew --prefix)/var/wikilayer`; its PostgreSQL server uses a private Unix socket and does not start the regular `postgresql@16` Homebrew service. This leaves other Wikilayer and PostgreSQL instances alone.

To stop or restart the service:

```sh
brew services stop wikilayer/tap/wikilayer
brew services restart wikilayer/tap/wikilayer
```

To upgrade, run `brew update && brew upgrade wikilayer/tap/wikilayer`, then restart the service. Uninstalling the formula does not remove the data directory. Back up `$(brew --prefix)/var/wikilayer` before deleting it or changing PostgreSQL major versions.

The app binary and MIT license are published as macOS arm64 and amd64 release archives in this repository. The source repository remains private.
