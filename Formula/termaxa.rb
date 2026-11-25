class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.25.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.1/termaxa-macos-arm64"
      sha256 "171f47ac2e80894f9fd0d457a952fe3ceb47d6ed200ce42a38cb8bac63c94763"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.1/termaxa-macos-x86_64"
      sha256 "53e6fa93fc91a36819ebeaaca7fb8f89694fd4e5cabf89c5f696401db8e3393d"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.25.1/termaxa-linux-x86_64"
    sha256 "c6225f2a2081f2d48be68703c9ca895d4bb01a69ef60a62df9a8ae8be4f7213e"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
