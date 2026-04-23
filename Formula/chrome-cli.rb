class ChromeCli < Formula
  desc "Control Google Chrome from the command line"
  homepage "https://github.com/lucacome/chrome-cli"
  url "https://github.com/lucacome/chrome-cli/releases/download/v2.0.0/chrome-cli-v2.0.0-macos.tar.gz"
  sha256 "284529ebb3331677c36d99ef8bbb1a2eae1be0469dd806f35dcaed5388ec78ca"
  version "2.0.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos
  depends_on "fzf"

  def install
    root = "chrome-cli-v#{version}-macos"

    bin.install "#{root}/chrome-cli"
    # Install wrapper scripts for chrome compatible browsers
    bin.install "#{root}/scripts/chrome-canary-cli"
    bin.install "#{root}/scripts/chromium-cli"
    bin.install "#{root}/scripts/brave-cli"
    bin.install "#{root}/scripts/vivaldi-cli"
    bin.install "#{root}/scripts/edge-cli"
    bin.install "#{root}/scripts/arc-cli"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"chrome-cli" if OS.mac?
  end

  test do
    system bin/"chrome-cli", "version"
  end
end
