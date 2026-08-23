# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.15.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.4/Proofboard-Career-Agent-darwin-arm64"
      sha256 "56c8b90ff2ce9e3d4fc3fe6ddbba337eff3dbe2987d1c30bc8fc1fbcdd89e160"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.4/Proofboard-Career-Agent-darwin-amd64"
      sha256 "b5771d85b5fb662142ef1435dca0462f326be2c10f106b3362e3d41da4c69516"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.4/Proofboard-Career-Agent-linux-amd64"
      sha256 "af776214ac9ea385b262d454e52af8cc8a79cf0d0a2ce9567915f14ffe06462d"
    end
  end

  def install
    bin.install Dir["Proofboard-Career-Agent-*"].first => "proofboard"
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
