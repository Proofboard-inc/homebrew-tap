# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.1/Proofboard-Career-Agent-darwin-arm64"
      sha256 "df9948274bd9a50ac6cd6a58bd12423fc1ff0ce07dababd4a45586bde03cbd41"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.1/Proofboard-Career-Agent-darwin-amd64"
      sha256 "cdd210f1dbb03d5104a51ebc2519bb798afe61faea6ca25f2c5978e8fe8b72e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.1/Proofboard-Career-Agent-linux-amd64"
      sha256 "01e6c7c697843c5d17c25304a8e1118d20704804f93f481e6f3c5625e1df3b58"
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
