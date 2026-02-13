class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.4.1/nono-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "b614a57015ebac670739359b463c01b6ee2780c74046b1f638446c801f46803b"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.4.1/nono-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "99354ee89996fdbf4a23e7a4ac522b78d5263f22c1bfeef86ee7a9133bad37e4"
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
