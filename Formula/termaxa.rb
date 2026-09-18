class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.0/termaxa-macos-arm64"
      sha256 "2cef8d8bc2dafca0ac44a1344807908f971977ca3d563735ed076ee9ca65e747"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.0/termaxa-macos-x86_64"
      sha256 "447c4f34acc8d4a2d6865883043d4ac74803e7aa474d80c91318980865eb8b3b"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.0/termaxa-linux-x86_64"
    sha256 "18e4c055906ac1cf25e2a7a6d8c4004f521a7184c6cc73031da0c8d42836119a"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
