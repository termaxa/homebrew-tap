class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.23.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.23.0/termaxa-macos-arm64"
      sha256 "a614c057fee9fd81db8c3500e6d4ba8e9bfc4abc3f61c957da62674a11170409"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.23.0/termaxa-macos-x86_64"
      sha256 "ce608f0a9c7e804a40a9582dd41d60763431bdf95042ff207adfc83d3aceefe7"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.23.0/termaxa-linux-x86_64"
    sha256 "617d8b9e9caffa06ec8ff5d64b5062dac669cbe47df21e04944031874d45ddc7"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
