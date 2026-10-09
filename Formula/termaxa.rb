class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.2/termaxa-macos-arm64"
      sha256 "dac63075e3c7af936ca50a6b1687aad922b6dfa400fe78a8367de90f9a051065"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.2/termaxa-macos-x86_64"
      sha256 "635c03cf2865506d64ee65a222b50ba4801423776b1d8fbd217e722594fa20aa"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.2/termaxa-linux-x86_64"
    sha256 "e93ee05252cbe2fe7e26aabaecb2b3bdc7f154daa5d6d461d3480223716e6870"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
