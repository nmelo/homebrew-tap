# homebrew-tap

Homebrew formulas for my tools.

## Usage

```bash
brew tap nmelo/tap
brew install <formula>
```

## Formulas

Standalone tools extracted from [steveyegge/gastown](https://github.com/steveyegge/gastown). We wanted the core agent communication primitives without the full orchestration framework, and adapted them to work with tmux windows rather than gastown's session-based approach.

| Formula | Description |
|---------|-------------|
| [ga](https://github.com/nmelo/gasadd) | Queue messages to Claude agents in tmux windows without interrupting |
| [gm](https://github.com/nmelo/gasmail) | Agent-to-agent messaging CLI using beads |
| [gn](https://github.com/nmelo/gasnudge) | Send nudge messages to Claude agents in tmux windows |
| [gp](https://github.com/nmelo/gaspeek) | Capture output from Claude agents in tmux windows |

## See Also

- [bd](https://github.com/steveyegge/beads) - Dependency-aware issue tracker for agent workflows
- [gt](https://github.com/steveyegge/gastown) - Multi-agent orchestration framework
