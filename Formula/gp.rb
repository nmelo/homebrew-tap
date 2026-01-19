class Gp < Formula
  desc "Capture output from Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gaspeek"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_darwin_arm64.tar.gz"
      sha256 "3da8f87981b350b51616db891c3f3142f4f5b6c4c23bd345f8debf3bb4d65ab4"
    end
    on_intel do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_darwin_amd64.tar.gz"
      sha256 "09faf73cde4af107fcf0bfe9a7ce2a8d898cbd6a617af5b36d2e56aef92bff3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_linux_arm64.tar.gz"
      sha256 "60f74c59916a89333823a8036c309caefdf2f3d7ad9171de0d3a477b5a73c25f"
    end
    on_intel do
      url "https://github.com/nmelo/gaspeek/releases/download/v0.1.0/gaspeek_linux_amd64.tar.gz"
      sha256 "9695ab30b1add37d8403a66961169f5b8b20bbc00f089b7c3f8a1f9e4839d725"
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
