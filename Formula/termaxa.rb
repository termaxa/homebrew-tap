class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.8"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.8/termaxa-macos-arm64"
      sha256 "c247302ab7cef936f59aa088f7749d6f940d5b20aaea61ae03fa76b18d08ca33"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.8/termaxa-macos-x86_64"
      sha256 "1141ec1ac2fe153b4f85be0bf28685d945d23e2902104bd16f5a6152595cdd6c"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.8/termaxa-linux-x86_64"
    sha256 "b5af8b3be38cdb44fe52a5ea181d474a76c3e09981cbde5f00f8c92b10eac0e9"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
