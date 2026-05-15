class ChromeCli < Formula
  desc "Control Google Chrome from the command line"
  homepage "https://github.com/lucacome/chrome-cli"
  url "https://github.com/lucacome/chrome-cli/releases/download/v2.1.0/chrome-cli-v2.1.0-macos.tar.gz"
  sha256 "912ebd5069211a13cad8961c95c61403b4ca1ae8f9953d302b4f99f32951cca2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos
  depends_on "fzf"

  def install
    bin.install "chrome-cli"
    # Install wrapper scripts for chrome compatible browsers
    bin.install "scripts/chrome-canary-cli"
    bin.install "scripts/chromium-cli"
    bin.install "scripts/brave-cli"
    bin.install "scripts/vivaldi-cli"
    bin.install "scripts/edge-cli"
    bin.install "scripts/arc-cli"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"chrome-cli" if OS.mac?
  end

  test do
    system bin/"chrome-cli", "version"
  end
end
