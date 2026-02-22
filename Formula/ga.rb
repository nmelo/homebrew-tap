class Ga < Formula
  desc "Queue messages to Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gasadd"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nmelo/gasadd/releases/download/v0.8.1/gasadd_darwin_arm64.tar.gz"
      sha256 "b538538d6181791a16cdbdcf8a9adb535b92089a93bda891d40d675b4506bc1d"
    end
    on_intel do
      url "https://github.com/nmelo/gasadd/releases/download/v0.8.1/gasadd_darwin_amd64.tar.gz"
      sha256 "9dd65eb3d41a8f9bdce97838733128e5ff6ff17f091ee59fad5393485652bb3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nmelo/gasadd/releases/download/v0.8.1/gasadd_linux_arm64.tar.gz"
      sha256 "fe3fda64823d778eb00b2d225a1d3698f8d37ca0caf13a274bd4168fbdac1b7b"
    end
    on_intel do
      url "https://github.com/nmelo/gasadd/releases/download/v0.8.1/gasadd_linux_amd64.tar.gz"
      sha256 "400c38c51c35db22d3a46684fe84bffc49effb7250ba650e5fbb0ffbc119e1a1"
    end
  end

  def install
    bin.install "ga"
  end

  test do
    system "#{bin}/ga", "--version"
  end
end
