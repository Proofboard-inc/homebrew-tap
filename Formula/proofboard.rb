# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.13.2/proofboard-darwin-arm64"
      sha256 "9442c88c772f4e3ad44ba25ee7ad13568a800e6b395cdd104243d89cf7e736ec"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.13.2/proofboard-darwin-amd64"
      sha256 "4e6ced584285ce41602d37897476ae523b23e1ba27b8b5bc2537c5569ff93aa7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.13.2/proofboard-linux-amd64"
      sha256 "54061c6a97579df0774f53b44d0060c61398a85110469822a2248c210f7baed2"
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
