class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.1/termaxa-macos-arm64"
      sha256 "51ff61d03e13c434034361012d48be469111dc9c85585135b808e7c4a9fa0564"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.1/termaxa-macos-x86_64"
      sha256 "462f015509b3660b6fea378a0e60d13e4534b947765071090e2f8045cf403aa8"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.1/termaxa-linux-x86_64"
    sha256 "685913a30c26cd406dd302208fb8931f9b45be769390125878df3c73978a89fc"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
