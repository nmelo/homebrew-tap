class BeadsUi < Formula
  desc "Web interface for viewing and managing beads issue tracking databases"
  homepage "https://github.com/nmelo/bdui"
  version "0.2.4"
  license "Apache-2.0"

  url "https://github.com/nmelo/bdui/releases/download/v0.2.4/beads-ui-0.2.4-standalone.tar.gz"
  sha256 "f7585c68ad9f08400bfb2b8902a555eeb6bae4f7db7eb7c903936bbd8265d023"

  depends_on "node"

  def install
    # Include hidden files like .next (Dir["*"] excludes dotfiles)
    libexec.install Dir["*"] + Dir[".*"] - [".", ".."]

    # Create wrapper script
    (bin/"beads-ui").write <<~EOS
      #!/bin/bash
      export PORT="${PORT:-3000}"
      export HOSTNAME="${HOSTNAME:-localhost}"
      cd "#{libexec}"
      exec node server.js "$@"
    EOS
  end

  def caveats
    <<~EOS
      Beads UI is a web interface for beads databases.

      To start the server:
        beads-ui

      Then open http://localhost:3000 in your browser.

      Configure workspaces in ~/.config/beads-ui/workspaces.json:
        {
          "workspaces": [
            { "id": "my-project", "name": "My Project", "databasePath": "/path/to/.beads/beads.db" }
          ]
        }

      Environment variables:
        PORT      - Server port (default: 3000)
        HOSTNAME  - Server hostname (default: localhost)
    EOS
  end

  test do
    assert_match "beads-ui", shell_output("ls #{libexec}")
  end
end
