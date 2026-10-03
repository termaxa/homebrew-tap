class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.20.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.20.1/termaxa-macos-arm64"
      sha256 "f18de0387f5147280283b93f60517ed512320518545eaed137a747f8b66a3545"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.20.1/termaxa-macos-x86_64"
      sha256 "fed69fc72cd3cafbb6abf7b9a5bbbdec5a752313d03e53dec96e8190de708a46"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.20.1/termaxa-linux-x86_64"
    sha256 "2f348b8d9bb53043d4590d1d8ed08432511a50e4a75e96b72e2d337230480b07"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
