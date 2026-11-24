class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.25.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.0/termaxa-macos-arm64"
      sha256 "1def57d27e07c698efbfe80a71ef9abf55de3d087f01ee8832bc2f80c692dfe6"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.0/termaxa-macos-x86_64"
      sha256 "2be02600dea0337b50bc0e550971c4c74d2c615e1858622db73265452b52a832"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.25.0/termaxa-linux-x86_64"
    sha256 "10591b0c517d482da67200713830ffa9e0a987ae97106f7e2f1f87951a6f0e7d"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
