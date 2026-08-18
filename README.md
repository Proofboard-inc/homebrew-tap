# Proofboard Homebrew Tap

Homebrew formula for the **Proofboard Career Agent**.

## Install

```sh
brew tap proofboard-inc/tap
brew install proofboard
```

Then start the background agent:

```sh
proofboard install
```

## Upgrading

Homebrew manages the executable, so upgrade with Homebrew rather than the
CLI's own updater:

```sh
brew upgrade proofboard
```

## What this installs

A prebuilt, release-signed binary from
[proofboard-cli](https://github.com/Proofboard-inc/proofboard-cli/releases),
rather than a from-source build. The release workflow signs each binary with
the project's release key, and the formula pins the SHA256 of the exact
artifact it downloads.

Supported: macOS (Apple Silicon and Intel) and Linux (x86_64).
