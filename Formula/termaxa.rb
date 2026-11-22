class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.24.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.24.0/termaxa-macos-arm64"
      sha256 "a99130fde05c5d06862d355e9a7c1171bb755b99ba4c7d1feffc2a2e82fad3a3"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.24.0/termaxa-macos-x86_64"
      sha256 "b5e9d933a7fe99c965708aa6457a31ccf368717a7541e8b309532abb8ff79010"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.24.0/termaxa-linux-x86_64"
    sha256 "10f99060f0d0cd99b57bd59c327cc2cbbb185959d5099d6e5544daa277a5662d"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
