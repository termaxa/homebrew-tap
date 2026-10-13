class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.4/termaxa-macos-arm64"
      sha256 "b2daae7c3c218eb74775ec278269fa27b7988ffb652486a505dcc74317c750c2"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.4/termaxa-macos-x86_64"
      sha256 "aad551583494f9d065c71f94586388eb5d18003c32e550807f24af2fb3494ac1"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.4/termaxa-linux-x86_64"
    sha256 "b1e3947cdcfee124b7c3645d35d0eae250b91f1973f81a842bf76f2431230860"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
