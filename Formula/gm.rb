class Gm < Formula
  desc "Agent-to-agent messaging CLI using beads"
  homepage "https://github.com/nmelo/gasmail"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.2/gasmail_darwin_arm64.tar.gz"
      sha256 "f188ca32e58289277ba4dde88344320cbb174ffced024a8d3fa695f418f166d4"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.2/gasmail_darwin_amd64.tar.gz"
      sha256 "0e5670516ffece3ee2a254fa7c80ed90bfc070ca0f5dabe75dab3b7ef93ed8db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.2/gasmail_linux_arm64.tar.gz"
      sha256 "d0823d4185269f771a8958dd38a1490aad00a3428517420ce9edfa033baf1b4e"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.2/gasmail_linux_amd64.tar.gz"
      sha256 "308e031fa564090e0702ec82025c2ff5a6494044e498322bf591f7dde401e4f9"
    end
  end

  def install
    bin.install "gm"
  end

  test do
    assert_match "gm", shell_output("#{bin}/gm --help")
  end
end
