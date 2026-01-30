class Ga < Formula
  desc "Queue messages to Claude agents in tmux windows without interrupting"
  homepage "https://github.com/nmelo/gasadd"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasadd/releases/download/v0.1.0/gasadd_darwin_arm64.tar.gz"
      sha256 "393968c7d938dac277dd8502797ef9346f9a68463bcad49f5fa1cb9255f80a65"
    end
    on_intel do
      url "https://github.com/nmelo/gasadd/releases/download/v0.1.0/gasadd_darwin_amd64.tar.gz"
      sha256 "266b7cc6fd1354ea29c2d2835b8b7e7196077516fb5c9ee741eb4c130730b58a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasadd/releases/download/v0.1.0/gasadd_linux_arm64.tar.gz"
      sha256 "88e2fb509726a0d398e24c4aa51b88fdfe5be0bc6b70061f25e22e574300902e"
    end
    on_intel do
      url "https://github.com/nmelo/gasadd/releases/download/v0.1.0/gasadd_linux_amd64.tar.gz"
      sha256 "5632035e35de37e511549aa6145137a246beae2c339f0e7f39ad78ae6612df7d"
    end
  end

  depends_on "tmux"

  def install
    bin.install "ga"
  end

  test do
    assert_match "ga", shell_output("#{bin}/ga --help")
  end
end
