class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.0/termaxa-macos-arm64"
      sha256 "efcf9b18aa78155af82cf08eb85782c25ea3378122e81fa7c10e3b58600f1788"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.0/termaxa-macos-x86_64"
      sha256 "a2ed364b8641f8052fb353489c7a942425fdb3f03a43955f91fae4d652f88ff4"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.0/termaxa-linux-x86_64"
    sha256 "f4b07db6fda7549d8bce818b0607ea19e28a27b268297384f39242ba016aa3f3"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
