class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.4.0/nono-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d35b424b63bf10d443d8ede8533f7122a8d10eb0c7f3451fa7c43e2e85d6e524"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.4.0/nono-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "cac797f92b495423f3dea2953510f16ce601537236f0f6f7925a55fb23a28b62"
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
