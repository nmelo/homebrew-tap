class BeadsUi < Formula
  desc "Web interface for viewing and managing beads issue tracking databases"
  homepage "https://github.com/nmelo/bdui"
  version "0.2.10"
  license "Apache-2.0"

  url "https://github.com/nmelo/bdui/releases/download/v0.2.10/beads-ui-0.2.10-standalone.tar.gz"
  sha256 "8452518e0d4ffefc40f9c2c4f2f9f9ea48831d029a44aa91c91b33049bdc81b4"

  depends_on "node"

  service do
    run [opt_bin/"beads-ui"]
    keep_alive true
    working_dir var/"beads-ui"
    log_path var/"log/beads-ui.log"
    error_log_path var/"log/beads-ui.log"
    environment_variables PORT: "3000", HOSTNAME: "localhost"
  end

  def install
    # Create directories for service
    (var/"beads-ui").mkpath
    (var/"log").mkpath
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

      To run as a background service (recommended):
        brew services start beads-ui

      To stop the service:
        brew services stop beads-ui

      Or run manually:
        beads-ui

      Then open http://localhost:3000 in your browser.

      Logs are written to: #{var}/log/beads-ui.log

      Configure workspaces in ~/.config/beads-ui/workspaces.json:
        {
          "workspaces": [
            { "id": "my-project", "name": "My Project", "databasePath": "/path/to/.beads/beads.db" }
          ]
        }
    EOS
  end

  test do
    assert_match "beads-ui", shell_output("ls #{libexec}")
  end
end
