class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.5/termaxa-macos-arm64"
      sha256 "61188ab1885cf91860e99a6261759fabbe5d17f7c3d5073974ffb198b561f7e4"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.5/termaxa-macos-x86_64"
      sha256 "76cd81731f542429e0ef50b5c1dbd5bef1978ad24e6f236d75fa01826ea5fec1"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.5/termaxa-linux-x86_64"
    sha256 "35871a63f60d3f9faff7724ea7634e07e19b24c5cd2cbe0949059cf083bc6189"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
