class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.6/termaxa-macos-arm64"
      sha256 "0c43d3671c817a871a80723dc9034a774583c53c6b64fbe796abf0fc52960ccd"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.6/termaxa-macos-x86_64"
      sha256 "6da5dd0e1aae450ab397c51c6fae3b7a11a9a95204ea7aecaf9be7a6017f5148"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.6/termaxa-linux-x86_64"
    sha256 "d2eb0618e2de9783af3a6de578920cd588d08276ada35ebc690b903fb48f1d23"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
