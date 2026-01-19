class Gm < Formula
  desc "Agent-to-agent messaging CLI using beads"
  homepage "https://github.com/nmelo/gasmail"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.1/gasmail_darwin_arm64.tar.gz"
      sha256 "575cd2b88b0f880dea39c6d2f3b918959bb5312358b24ef6701b2c89001f46ab"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.1/gasmail_darwin_amd64.tar.gz"
      sha256 "ae39f1ba79e0506523220271a22857ee4e52e275edb145750bc5cad6dbb29d59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.1/gasmail_linux_arm64.tar.gz"
      sha256 "f71e2509aed75a7d8511ad07698a6a5b8a3a2205e57bbfc3798e768b5b7be36b"
    end
    on_intel do
      url "https://github.com/nmelo/gasmail/releases/download/v0.2.1/gasmail_linux_amd64.tar.gz"
      sha256 "90c9dc4fd43bd89571b5e13c319c90624315f10e2d48c51373f89fc840e81547"
    end
  end

  def install
    bin.install "gm"
  end

  test do
    assert_match "gm", shell_output("#{bin}/gm --help")
  end
end
