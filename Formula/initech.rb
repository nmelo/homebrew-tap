class Initech < Formula
  desc "Bootstrap and manage multi-agent development projects"
  homepage "https://github.com/nmelo/initech"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.2.0/initech_darwin_arm64.tar.gz"
      sha256 "615b1336fdba756a5af802452af1ea95e92309bddde4833a26b566c38c3c98b0"
    end
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.2.0/initech_darwin_amd64.tar.gz"
      sha256 "94e694ecf813841a206035a666ef5f8b0263bd6bfd9b2239fbf8a33ce059414c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.2.0/initech_linux_arm64.tar.gz"
      sha256 "b99ef38f4db4dcd817f16f804561ad8e892d60c928785aa3c630ae30ad16af94"
    end
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.2.0/initech_linux_amd64.tar.gz"
      sha256 "f7c0810ded0adf59407ebe0c72be7975c5db55406ff4f83285bf722ba75115b2"
    end
  end

  depends_on "tmux"

  def install
    bin.install "initech"
  end

  test do
    assert_match "initech", shell_output("#{bin}/initech version")
  end
end
