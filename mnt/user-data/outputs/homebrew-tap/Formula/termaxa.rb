class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.17.0/termaxa-macos-arm64"
      sha256 "3a9217e0fd329905a81bdf9b63429424380796841fb921d3a96de5ca3b028466"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.17.0/termaxa-macos-x86_64"
      sha256 "2e721504ac41aa9d9a83ac57fac7d67d2e8dae9ebc237c5679c2ce238d182032"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.17.0/termaxa-linux-x86_64"
    sha256 "88bd8a4001449cb0fb81eee39280cc7ccb7293e9b069ad14500d0f4e14ad4809"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
