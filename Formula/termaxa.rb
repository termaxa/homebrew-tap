class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.19.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.5/termaxa-macos-arm64"
      sha256 "01180ef9ea4e7ff33eb85866dbd8588f4879a016738f1e81926ab767eaaf2bc9"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.19.5/termaxa-macos-x86_64"
      sha256 "9964fa0b30d5282972c35a3c2c54185065dd71da05c3d1f7093da938e46874a6"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.19.5/termaxa-linux-x86_64"
    sha256 "ae2d4d9afe6c3fc55b4c42f6793380d559a43ef87a6afa136c6c748a3ee98581"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
