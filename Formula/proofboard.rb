# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.14.2/proofboard-darwin-arm64"
      sha256 "b88ac6db876828bbbe569dc4be4abc9d997b794ac0efb6fad8075f7f0a6e7712"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.14.2/proofboard-darwin-amd64"
      sha256 "ae90f71984a53c573a6258fb6fa5012e6ccb0420f418d126e1044946d8c977f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.14.2/proofboard-linux-amd64"
      sha256 "9c212f79859e4cd82c15b8ba4d463a028498d64f0153ef72f0f7b55c36852e69"
    end
  end

  def install
    bin.install Dir["proofboard-*"].first => "proofboard"
  end

  def caveats
    <<~EOS
      Start the background Career Agent with:
        proofboard install

      Homebrew manages the executable, so use `brew upgrade proofboard`
      rather than `proofboard update` to move between versions.
    EOS
  end

  test do
    assert_match "proofboard version #{version}", shell_output("#{bin}/proofboard version")
  end
end
