class BeadsUi < Formula
  desc "Web interface for viewing and managing beads issue tracking databases"
  homepage "https://github.com/nmelo/bdui"
  version "0.2.13"
  license "Apache-2.0"

  url "https://github.com/nmelo/bdui/releases/download/v0.2.13/beads-ui-0.2.13-standalone.tar.gz"
  sha256 "75ba277f953a20baab4e9b9aaecd070903bcf1f6093e755f6615b6b63da0d3fd"

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

    # Create wrapper script with full path to node for launchd compatibility
    (bin/"beads-ui").write <<~EOS
      #!/bin/bash
      export PORT="${PORT:-3000}"
      export HOSTNAME="${HOSTNAME:-localhost}"
      cd "#{libexec}"
      exec "#{Formula["node"].opt_bin}/node" server.js "$@"
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
