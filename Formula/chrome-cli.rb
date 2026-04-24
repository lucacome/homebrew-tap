class ChromeCli < Formula
  desc "Control Google Chrome from the command line"
  homepage "https://github.com/lucacome/chrome-cli"
  url "https://github.com/lucacome/chrome-cli/releases/download/v2.0.4/chrome-cli-v2.0.4-macos.tar.gz"
  sha256 "8b6ef81f74aa63d0fb657051dcd89c6a101ddcde975154691edf3be245aa8fc6"
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
