class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.2/termaxa-macos-arm64"
      sha256 "21eaa5918283b18d916f1ab7d5f40a7c9e282d9f91389ae0a727fb845ace2274"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.2/termaxa-macos-x86_64"
      sha256 "d8809c1fccf8300c46e97591156f00b45791ee8a3746d53fb817c9e0f299ab27"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.2/termaxa-linux-x86_64"
    sha256 "fa8f7bb73c5520614afd744d7192c401a1585fd427a113fd62dc471ecf22fe0b"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
