class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.22.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.22.0/termaxa-macos-arm64"
      sha256 "2d84bb61ab4e08f93a7289d7daceba8c78870986f28621cebbc5ddd892ce4398"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.22.0/termaxa-macos-x86_64"
      sha256 "19190775621f58d50cee8f997c5e6c36dc77b84da877594fb99a597c1930f0b1"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.22.0/termaxa-linux-x86_64"
    sha256 "82361331f8f0e7d0158a5fba060714a4693fd710b8612d4e89ef29c495ab48b2"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
