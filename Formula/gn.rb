class Gn < Formula
  desc "Send nudge messages to Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gasnudge"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.2.0/gasnudge_darwin_arm64.tar.gz"
      sha256 "2672fdec4e6f9a20d101fdb12c8c5a1da2487be3077d0fb338525b8ab305a4f5"
    end
    on_intel do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.2.0/gasnudge_darwin_amd64.tar.gz"
      sha256 "7d23f7d60247515df57b7add10aaac16288989fa8c92d707fd5d1b7b542bea6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.2.0/gasnudge_linux_arm64.tar.gz"
      sha256 "a0f31be20b0f56a9ee5174aea629a114ac5559c91c0aa19c7d9bec015e9b8281"
    end
    on_intel do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.2.0/gasnudge_linux_amd64.tar.gz"
      sha256 "f28b063ddbd472bd43947e34cb2399418402da4f7983522966eaeaa7525a1f27"
    end
  end

  depends_on "tmux"

  def install
    bin.install "gn"
  end

  test do
    assert_match "gn", shell_output("#{bin}/gn --help")
  end
end
