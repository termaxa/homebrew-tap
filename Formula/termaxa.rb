class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.4/termaxa-macos-arm64"
      sha256 "30b5c2893d87e24f8c816fcbbc766deac71c75dc38e8f1ea62e50d3edfb22d88"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.4/termaxa-macos-x86_64"
      sha256 "57cde6a1f9c30c287bafc75bbe191b97e75be178842dc4b839404ebaf6cd509f"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.4/termaxa-linux-x86_64"
    sha256 "c1fc00239f1dc311f5e7301fe03e708d58e8871dbe5607d3e8aa849b6baebce2"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
