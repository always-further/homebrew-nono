class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.7/nono-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "e1cfa8b67bf2bec16dcef438814069f90f5fe120586c5a83569af6a5b9eaba60"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.7/nono-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "5a955caff3301f539bde71fc083d1e81dc49ba5210c76d0ad4ccf0f8f54cc381"
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
