class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.2/termaxa-macos-arm64"
      sha256 "41aa22d0cb4dc8625ec7d2f2744117bedceea8142092e0e7f73a5dc51c89c537"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.2/termaxa-macos-x86_64"
      sha256 "96f4f9a51f6256adb60ebae27bc90fb58aafa09b8b405079651c2bbff824862b"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.2/termaxa-linux-x86_64"
    sha256 "0c2667ca388ebca30730f3e4938062937582ad816eeab4c28b60b869dd220e39"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
