class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.1/termaxa-macos-arm64"
      sha256 "9f586588efdb2d68154b1127a0ad849289e41f4df3b493f5637a08c6fbe132f6"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.1/termaxa-macos-x86_64"
      sha256 "daa6ba66f3757fdcb5ffbad0f71d892aded3bb777a1412fccde928bd510e18e9"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.1/termaxa-linux-x86_64"
    sha256 "055cc6d86279502887580c9e540f2098022cdf89434b8408f574da6978e9eedd"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
