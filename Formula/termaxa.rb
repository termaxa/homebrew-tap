class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.4/termaxa-macos-arm64"
      sha256 "c7f81c2c5fa14ad7f86e7b7be27d372d2893e3156e99c5350fb98577b9b876c4"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.4/termaxa-macos-x86_64"
      sha256 "db88a2ca4a624b7421bb1879bb587adcba11ce7dedd6f6f80a36131edc321407"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.4/termaxa-linux-x86_64"
    sha256 "c62f534ee47c07a796ccc6514aa9e38b4a2dfe173ea17e9d437fe7138248fa0b"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
