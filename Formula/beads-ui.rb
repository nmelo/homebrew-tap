class BeadsUi < Formula
  desc "Web interface for viewing and managing beads issue tracking databases"
  homepage "https://github.com/nmelo/bdui"
  version "0.2.23"
  license "Apache-2.0"

  url "https://github.com/nmelo/bdui/releases/download/v0.2.23/beads-ui-0.2.23-standalone.tar.gz"
  sha256 "b7b1c4a5943f53a35ee361a2bc266566d1e7a523ea9269e95148909607384dc6"

  depends_on "node"

  service do
    run [opt_bin/"beads-ui"]
    keep_alive true
    working_dir var/"beads-ui"
    log_path var/"log/beads-ui.log"
    error_log_path var/"log/beads-ui.log"
    environment_variables PORT: "3000", HOSTNAME: "localhost", WS_PORT: "3001"
  end

  def install
    # Create directories for service
    (var/"beads-ui").mkpath
    (var/"log").mkpath
    # Include hidden files like .next (Dir["*"] excludes dotfiles)
    libexec.install Dir["*"] + Dir[".*"] - [".", ".."]

    # Create wrapper script with full path to node for launchd compatibility
    # Starts both the Next.js server and WebSocket server for live-reload
    (bin/"beads-ui").write <<~EOS
      #!/bin/bash
      export PORT="${PORT:-3000}"
      export HOSTNAME="${HOSTNAME:-localhost}"
      export WS_PORT="${WS_PORT:-3001}"
      export PATH="#{Formula["node"].opt_bin}:$PATH"
      cd "#{libexec}"
      exec ./beads-ui "$@"
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
