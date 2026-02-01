class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.1.0/nono-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "54c7cc43fac828fbe7d0f38a03373cd1453355fbce3d638fbc053a4f49aabf56"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.1.0/nono-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c146facc93b927a5cf3097d62539177e254183ad06ec03bf1dc248791060d042"
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
