class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.7/termaxa-macos-arm64"
      sha256 "93f8570f9b89727dc8da024b9b7b6e0343afb805423b39ae285997a65a97dd71"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.7/termaxa-macos-x86_64"
      sha256 "9f63f4539ee1c7ba7bda1ac3e25621cbe4a0b091dd16c5e757610985f1eccd7d"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.7/termaxa-linux-x86_64"
    sha256 "d35917695ca104c0830fc3e29ee765b30b7735c2525b331f2a628aed4f6a6663"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
