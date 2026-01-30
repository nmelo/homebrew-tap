class Gn < Formula
  desc "Send nudge messages to Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gasnudge"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.3.0/gasnudge_darwin_arm64.tar.gz"
      sha256 "e4e8e057fb05b473e30359898505e48a68ee3fc8dc9746b2db1625e440d75c3a"
    end
    on_intel do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.3.0/gasnudge_darwin_amd64.tar.gz"
      sha256 "2cf266e5fa5550cc35392da104cd10be68f459a257934509695f635dd2165845"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.3.0/gasnudge_linux_arm64.tar.gz"
      sha256 "550496dfb8b3a2a2aae1d84b6bde1fa3b5677cca28081fe0c78fb830250c3e28"
    end
    on_intel do
      url "https://github.com/nmelo/gasnudge/releases/download/v0.3.0/gasnudge_linux_amd64.tar.gz"
      sha256 "60b0c0c8aac6991efa67c9f949c289efeb7803879ea9dd402076eb7f56c92dd9"
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
