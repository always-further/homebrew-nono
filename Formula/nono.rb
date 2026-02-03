class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.3/nono-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "63adf27eba7622b68799288bf7a84781038552570753842cadeea1b08f1a331c"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.3/nono-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "beb587509ede592935aa450575dd461080aff02688c3819bc74958f07c3c8247"
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
