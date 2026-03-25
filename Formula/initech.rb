class Initech < Formula
  desc "Bootstrap and manage multi-agent development projects"
  homepage "https://github.com/nmelo/initech"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.3.0/initech_darwin_amd64.tar.gz"
      sha256 "48710224b2a13b3c136c1f90e052f533dcc0d937f28633e0fc2c70d35b397924"
    end
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.3.0/initech_darwin_arm64.tar.gz"
      sha256 "6ccf19f9bf1d61f45253160b7f4fae270508b05d8fed4f1a7a2c4b4ee71be1e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.3.0/initech_linux_amd64.tar.gz"
      sha256 "169d5e89f1b0c33b1f7f2014ef470da7ed3c95aaa5559cba9d23c97e27216334"
    end
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.3.0/initech_linux_arm64.tar.gz"
      sha256 "3c7c1b5eb973019c130c957f428094c3e6b54fde279222e2585a6b769ae6ecf6"
    end
  end

  def install
    bin.install "initech"
  end

  test do
    system "#{bin}/initech", "version"
  end
end
