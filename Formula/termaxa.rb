class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.3/termaxa-macos-arm64"
      sha256 "ab3aa21cad093363e900a7d2fb7952bed7404a52eed565fcf8c925b496154a17"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.3/termaxa-macos-x86_64"
      sha256 "2d7f2b8ff1f49aa68edfc8bf4ab7cf3cb09972e9bc6486bc133412e2e7a26297"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.3/termaxa-linux-x86_64"
    sha256 "042ca255b61e9bc723a02f2343a5b3f5c4b6584c47c3bc983a5ce2f5a8f64d6d"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
