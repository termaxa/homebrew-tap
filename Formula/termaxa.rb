class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.25.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.2/termaxa-macos-arm64"
      sha256 "d6d6df9ff483ffc4a7950da72b7126279028fc4aceec58b1834fe314aafb302a"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.25.2/termaxa-macos-x86_64"
      sha256 "700564ce585d4c1b83c84922ba1ff8baf69e0f93f9f28a26439b2e64f070ee31"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.25.2/termaxa-linux-x86_64"
    sha256 "754d23fade3bae692e4393bc7adceb7a989d5b185f9022ce71175b80d2ef8cad"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
