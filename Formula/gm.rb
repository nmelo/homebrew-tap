class Gm < Formula
  desc "Agent-to-agent messaging CLI using beads"
  homepage "https://github.com/nmelo/gasmail"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.0/gasmail_darwin_arm64.tar.gz"
      sha256 "d2d48491e76d5b926222efd9971137cc629bc691e3ea2a8570fd9427d969bdba"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.0/gasmail_darwin_amd64.tar.gz"
      sha256 "6bcf2d43ace8eb65ecf88726ed43831b4586d7f0c09a7e6c15dabee6035833ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.0/gasmail_linux_arm64.tar.gz"
      sha256 "9fb319f082e1b1c298085e2c08ed8db76df9fe2b253fb0493da0240b15697c06"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.0/gasmail_linux_amd64.tar.gz"
      sha256 "114e9d16af3e84bfe53bc621b31eae2546722dbcc7aac1fae4d36c07304cce58"
    end
  end

  def install
    bin.install "gm"
  end

  test do
    assert_match "gm", shell_output("#{bin}/gm --help")
  end
end
