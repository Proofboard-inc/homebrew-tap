# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.11.0/proofboard-darwin-arm64"
      sha256 "91e7ebe0cd521de1368ff95f98dc0165ea8a6a209b4da84fe1bd36fd910e8762"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.11.0/proofboard-darwin-amd64"
      sha256 "8c8840d63d9d6692047e81c35a848a8a6a1f6bfe1093db973c5c0c10ac7fae65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.11.0/proofboard-linux-amd64"
      sha256 "911651f6c0fe423b9929c10079c236a50562735288d27428567946ffa866b328"
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
