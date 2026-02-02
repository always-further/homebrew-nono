class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.1.2/nono-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "003aace6f86f5f76402bf6621ae41a92490638e1419bcf617ac78a45d09e9894"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.1.2/nono-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "3d3557e768a71f805dd5f8397a3ea345bcceb9baf8ec6cf88a1cf123b6a6d67c"
    end
  end

  def install
    bin.install "nono"
  end

  def caveats
    <<~EOS
      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command

      For more information:
        nono --help
        nono run --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nono --version")
  end
end
