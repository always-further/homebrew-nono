class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.5/nono-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "0e012cfc43105111c9065dc8610207df1d87946ffd2886743969dc2f73c876cc"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.5/nono-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "2b31dfeb54f97aee91fc97d5e2dddfa56bc9dc4a909ccb06bb111225a7b2fb59"
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
