class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.9"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.9/termaxa-macos-arm64"
      sha256 "3803572f3bcec616db97074f98c96b410d9be50353d0be8c5bc09252525daeba"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.9/termaxa-macos-x86_64"
      sha256 "a22fc51a5a2b85b1612f17c39f9727f18baa43d0fdcd1a25d70418e5449ae767"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.9/termaxa-linux-x86_64"
    sha256 "ab480b2f4661cbe7eec23180f5d9729353e9878499f6d1772b39978ba9f42770"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
