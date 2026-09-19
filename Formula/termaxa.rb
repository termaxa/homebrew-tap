class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.1/termaxa-macos-arm64"
      sha256 "638c7ff13a8ee5d2908ac4fc06b24e8c57f1452368b9de46a0298d8fb887532a"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.1/termaxa-macos-x86_64"
      sha256 "c11466ce1733caff25de6012e64a601966ef82796f4e5636a9b3cbee3a7872fc"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.1/termaxa-linux-x86_64"
    sha256 "db4b22936d3e5bd0da253aa06cc3930fb9435c296c6f06c6644b8f1a07290a42"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
