# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.16.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.4/Proofboard-Career-Agent-darwin-arm64"
      sha256 "2e8a1d967e4ab8765d3400fe4bd031c114f82cae8414542bf158849167d3ca2a"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.4/Proofboard-Career-Agent-darwin-amd64"
      sha256 "1305557d71bdf81df895122f7006323025cde9588c28007ca387d6c6be5dd7e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.4/Proofboard-Career-Agent-linux-amd64"
      sha256 "bdb24bf477ba4210ef9c7d2fd341061a33ab41a06806c1cc1e02205788be634b"
    end
    # Single-board machines and ARM cloud instances. The release publishes a
    # linux-arm64 build, so refusing it here would describe the tap rather
    # than the tool.
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.4/Proofboard-Career-Agent-linux-arm64"
      sha256 "de23c0a148f70f1dbbac6c894710eccc721660b9e4cbc25cd690b3dddfc468bf"
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
