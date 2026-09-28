class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.6/termaxa-macos-arm64"
      sha256 "acfc7c8190187668c2a909ba14efd4332d81eb32f22ff3957e332af90a5eb7c5"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.6/termaxa-macos-x86_64"
      sha256 "9ddcd8caa52e427f9e77e88afb4cb0d965f4dfa35c30c88c28c6660cba62e191"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.6/termaxa-linux-x86_64"
    sha256 "bcea19648d131715e5504ce5a04d7c7b876c9abaa0c1f212759aa6d34d50cd06"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
