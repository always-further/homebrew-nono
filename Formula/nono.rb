class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.0/nono-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "39714b4931fa21cb01e4d5556246c2fa4eaa2f6bbed14ceb1831d7bc245d92f0"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.0/nono-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "aa9b0cb4e6d5652def3058b8611bb7b0d890fdaa00fb1a475a42db6adc7f0116"
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
