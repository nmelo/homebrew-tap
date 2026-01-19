class Gn < Formula
  desc "Send nudge messages to Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gasnudge"
  url "https://github.com/nmelo/gasnudge/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "61608684cd2b220484ae30e51e75e7b9e3c5e5783e4aa811c639dd73b4b28f35"
  license "MIT"
  head "https://github.com/nmelo/gasnudge.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"gn")
  end

  test do
    assert_match "gn", shell_output("#{bin}/gn --help")
  end
end
