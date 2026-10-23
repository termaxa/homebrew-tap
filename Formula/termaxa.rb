class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.6/termaxa-macos-arm64"
      sha256 "b35a96b97e960d4e77636ab1848917c2c4fdd88d291026a5aeeeebde77d1c4cb"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.6/termaxa-macos-x86_64"
      sha256 "e57270954e461f254a2cbd75261f230004f396298833d5cef666b0f3b33efd3d"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.6/termaxa-linux-x86_64"
    sha256 "501c6bc82e42c4910100e7d1f9f8ae52ce9872986d596631899982aeaa285f20"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
