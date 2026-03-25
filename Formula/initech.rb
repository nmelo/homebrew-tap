class Initech < Formula
  desc "Bootstrap and manage multi-agent development projects"
  homepage "https://github.com/nmelo/initech"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.1.0/initech_darwin_arm64.tar.gz"
      sha256 "f5c7f0a5a006b2ede1a22db1b80b53c06a072eba0090c0f6fee64d06bd9df904"
    end
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.1.0/initech_darwin_amd64.tar.gz"
      sha256 "16fd6c37f32bdf48bf6f26803a3b32ec2e07381b69abb0e0a9cf42678cb82969"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/initech/releases/download/v0.1.0/initech_linux_arm64.tar.gz"
      sha256 "2b24b1c97088b2a454bd8677963141d4fe1512f7ec8dc64c75824679156b4b4b"
    end
    on_intel do
      url "https://github.com/nmelo/initech/releases/download/v0.1.0/initech_linux_amd64.tar.gz"
      sha256 "96fde82104a544c1c47bd7a1086fa7d9d0620d76cf3a1b75e883f676212fec67"
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
