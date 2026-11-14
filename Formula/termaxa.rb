class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.10"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.10/termaxa-macos-arm64"
      sha256 "d9e660c0c2d7d71ab71c54f614888866302b4f3b9aad0bb74c4af3ccaba72cce"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.10/termaxa-macos-x86_64"
      sha256 "b4caf58a6e5bb3ff41e255be1c2dc3962dab1cce5107abdce488d35eae9c7477"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.10/termaxa-linux-x86_64"
    sha256 "b9e56246dfd073ac2e5653c79105a61df7a97c4247190a5b9bd1e7a1a3b49493"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
