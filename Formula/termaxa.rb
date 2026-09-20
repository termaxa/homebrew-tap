class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.3/termaxa-macos-arm64"
      sha256 "bdcb25cf1f422647cf043e62a025c0795dfe1d1e2849bef859c2bcfc073cc568"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.3/termaxa-macos-x86_64"
      sha256 "57b17cd181a3c3a6779d301fd81ca3ee4f61bffe70e202a9e443aed110366195"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.3/termaxa-linux-x86_64"
    sha256 "16b416e299f896371bae46a2e51fe5b547808436e100ba33f84c7132e0b0ccf8"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
