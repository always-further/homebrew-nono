class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.1/nono-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "933258ebc8d648e1c5712691f64d125e4aea402fffecbbb7285ff582085b9588"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.1/nono-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "20f3d0a62f87e16a688a6d35474ab2cfb8e834086f1a3e9624f3a2b096fe7461"
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
