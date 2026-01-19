class Gp < Formula
  desc "Capture output from Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gaspeek"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_darwin_arm64.tar.gz"
      sha256 "e3eeb6b4760e3fbac21e54015e27e4c58fb51b12bd6734ff4ed317359cd5f4f6"
    end
    on_intel do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_darwin_amd64.tar.gz"
      sha256 "c1a0f935c6e18ea4bc39220d8aaa5355f0488c6ecb4cdf48faa5c4c94e51e849"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_linux_arm64.tar.gz"
      sha256 "10733637d5f8560e2ea845bf46c03a00a4691a264dff39e55ab7b0ca78033be0"
    end
    on_intel do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_linux_amd64.tar.gz"
      sha256 "9040b622cbc961e5b83f97b78703102d31df8f5650b507d37a6ce72df0ea291a"
    end
  end

  depends_on "tmux"

  def install
    bin.install "gp"
  end

  test do
    assert_match "gp", shell_output("#{bin}/gp --help")
  end
end
