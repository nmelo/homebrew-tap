class Gp < Formula
  desc "Capture output from Claude agents in tmux windows"
  homepage "https://github.com/nmelo/gaspeek"
  url "https://github.com/nmelo/gaspeek/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5559a8474703c753f8597e239037f75d81c32cfda2945998bca040dd3fef3d0"
  license "MIT"
  head "https://github.com/nmelo/gaspeek.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"gp")
  end

  test do
    assert_match "gp", shell_output("#{bin}/gp --help")
  end
end
