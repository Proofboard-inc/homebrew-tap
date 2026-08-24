# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.16.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.2/Proofboard-Career-Agent-darwin-arm64"
      sha256 "ddf435393942d8eb636fc85701bd370347863fc6498fc6b34d5b59a17173805c"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.2/Proofboard-Career-Agent-darwin-amd64"
      sha256 "f68f188e683a1040e72fbf2abc633cfa2f2b9128cd8c78723a844590281c7cd8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.2/Proofboard-Career-Agent-linux-amd64"
      sha256 "533898c760e11dd737a63ae4b414dc42210bc7e98405adf652d5fb2886244161"
    end
    # Single-board machines and ARM cloud instances. The release publishes a
    # linux-arm64 build, so refusing it here would describe the tap rather
    # than the tool.
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.2/Proofboard-Career-Agent-linux-arm64"
      sha256 "603a7f22431e5f2878fd71bf7063490b384b58a84f6d5f6526b1e1d1430c0972"
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
