# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.16.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.3/Proofboard-Career-Agent-darwin-arm64"
      sha256 "2d736df1b01d444c3b2960c5ed46830f799bc6cc76a06b2693f0fd6e37cd614a"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.3/Proofboard-Career-Agent-darwin-amd64"
      sha256 "5ef879915493f52c4f247d03fe959bbee51d76a979cca67488c38381ae39e34d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.3/Proofboard-Career-Agent-linux-amd64"
      sha256 "7dfaacee3e00c22c8aaf5b2cf2267b87d9302fe2e4f0387c8ce5058f9d71a76f"
    end
    # Single-board machines and ARM cloud instances. The release publishes a
    # linux-arm64 build, so refusing it here would describe the tap rather
    # than the tool.
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.16.3/Proofboard-Career-Agent-linux-arm64"
      sha256 "1ed2ac4c64b379252d35985cbf0622d648cbded763aff835c9c29bb4e44ae534"
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
