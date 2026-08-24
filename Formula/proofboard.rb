# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.15.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.5/Proofboard-Career-Agent-darwin-arm64"
      sha256 "be196553f72e27f7761ca62328a399cc7f6e7939dd93d021467b961c382e6074"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.5/Proofboard-Career-Agent-darwin-amd64"
      sha256 "30b6abe380fbebb2a5a3e7800f6de76e617177e23e87ecc122b89aae839e589a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.15.5/Proofboard-Career-Agent-linux-amd64"
      sha256 "0e91b97eed6025ddc0a28043f69fb30c02d4f07e0efa579d961a72006f82c3e0"
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
