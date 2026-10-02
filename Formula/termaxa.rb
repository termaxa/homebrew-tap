class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.20.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.20.0/termaxa-macos-arm64"
      sha256 "64bd9226ca69cb3907a157402a746f075550702c8465f6b39c5af87bfe927198"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.20.0/termaxa-macos-x86_64"
      sha256 "5869c0ab2c0d32527d14fa0f9391f035fbd88a06fa153cf9f8894cba0e7b4992"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.20.0/termaxa-linux-x86_64"
    sha256 "922a9d3a0a957cf92930a1d9488b53ea66b6ec8fb430464a1ff8e7e541379918"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
