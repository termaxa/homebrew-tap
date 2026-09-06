class Termaxa < Formula
  desc "Cooperative gate for the shell commands AI coding agents run"
  homepage "https://termaxa.com"
  version "0.18.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.0/termaxa-macos-arm64"
      sha256 "c150e29818df4adb962a3bda6fa0d048c9603d8ee95cfae29d9f251c9ea54745"
    else
      url "https://github.com/termaxa/termaxa/releases/download/v0.18.0/termaxa-macos-x86_64"
      sha256 "537a025ac6664f781a01821c10a6b9d64005535c1235e8c65ea5173680eab152"
    end
  end

  on_linux do
    url "https://github.com/termaxa/termaxa/releases/download/v0.18.0/termaxa-linux-x86_64"
    sha256 "8dd5a4c6c6c9feef4c04e3820a68ac01ce3502a94a1863b8f77d4cc0553c2912"
  end

  def install
    binary = Dir["termaxa*"].first
    bin.install binary => "termaxa"
  end

  test do
    assert_match "termaxa #{version}", shell_output("#{bin}/termaxa --version")
  end
end
