class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.5/termaxa-macos-arm64"
      sha256 "eee6a9b9b6b5fd406ceba2b92ea682a59aa8ce0f0feeb6aca2d07414c3f84ce9"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.5/termaxa-macos-x86_64"
      sha256 "6302f8ca420dca5734bcbc8f735ce3e439d3dee5e79ad9427b558f1208475540"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.5/termaxa-linux-x86_64"
    sha256 "3669bf4414213b8eafd4191858f0caeb0ca02abdd6e73d6cac93546f853886b3"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
