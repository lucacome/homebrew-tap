# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "chrome-cli" do
  version "2.0.0"
  sha256 "284529ebb3331677c36d99ef8bbb1a2eae1be0469dd806f35dcaed5388ec78ca"

  url "https://github.com/lucacome/chrome-cli/releases/download/v#{version}/chrome-cli-v#{version}-macos.tar.gz"
  name "chrome-cli"
  desc "Control Google Chrome from the command line"
  homepage "https://github.com/lucacome/chrome-cli"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_latest
  end

  # depends_on macos: ""

  # app ""
  binary "chrome-cli"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  # zap trash: ""
end
