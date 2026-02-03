class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.3/nono-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "9da3f0548c0902a82cf4ff62aae6ffd6a6e5731146629203cfce08ee459bb0ab"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.3/nono-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "30df8a1e3ef4158bb4e00417459fa56272498a3435e370e647999918210c3749"
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
