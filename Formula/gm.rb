class Gm < Formula
  desc "Agent-to-agent messaging CLI using beads"
  homepage "https://github.com/nmelo/gasmail"
  url "https://github.com/nmelo/gasmail/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f99e41aab44c9e7a95428b694f710a41363cb7ce5c803f413082cb4ce71dfc5f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "gm", shell_output("#{bin}/gm --help")
  end
end
