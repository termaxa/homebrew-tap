class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.21.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.3/termaxa-macos-arm64"
      sha256 "17cb53870ce8a9e6eedfa1482b31e659023efeb440c6164d72c2324d824f170e"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.21.3/termaxa-macos-x86_64"
      sha256 "4536b9ed93c144fcdb969a50a890480a209319e3154f0c29687640abbef5c2e1"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.21.3/termaxa-linux-x86_64"
    sha256 "784d36ccdd4e661f4603f57ea14e9f595aa978a28948d7babca8a3eadfc32108"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
