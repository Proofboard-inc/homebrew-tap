# Proofboard Career Agent — https://github.com/Proofboard-inc/proofboard-cli
#
# Distributed as prebuilt, release-signed binaries rather than built from
# source: the release workflow signs each binary with the project's release
# key and the CLI verifies that signature when self-updating, so a
# Homebrew-compiled binary would not carry a signature the updater accepts.
class Proofboard < Formula
  desc "Proofboard Career Agent - builds your engineering career record locally"
  homepage "https://github.com/Proofboard-inc/proofboard-cli"
  version "1.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.12.2/proofboard-darwin-arm64"
      sha256 "24959af2ce9cff5ff4280464a78036d922dce3c96e3a3d928641a932ef6655c4"
    end
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.12.2/proofboard-darwin-amd64"
      sha256 "9b4a3b8c2ab322e3e61aee78b4bbbfa65c955866956a2869c6a6cbd691cb8d0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Proofboard-inc/proofboard-cli/releases/download/v1.12.2/proofboard-linux-amd64"
      sha256 "682f5951b65e6a8414456b0aacbd4d7e5c6f4499cb14cd3d936298dd9c9e4b8c"
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
