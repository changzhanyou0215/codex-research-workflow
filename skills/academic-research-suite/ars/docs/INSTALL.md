# Install Academic Research Skills

This mirror supports three agent runtimes from the same cleaned repository:

- Claude Code: native upstream layout and plugin metadata.
- Codex: single `$academic-research-suite` router skill.
- OpenCode: project agent plus `ars-*` commands.

The upstream license is CC BY-NC 4.0. Keep `LICENSE`, `NOTICE.md`, and
`FORK_NOTICE.md` with any redistribution.

## Claude Code

### Plugin install

In Claude Code:

```text
/plugin marketplace add crazymsn/academic-shcolar-skills
/plugin install academic-research-skills
```

Then try:

```text
/ars-plan
```

### Project skills install

Clone the repository:

```bash
git clone https://github.com/crazymsn/academic-shcolar-skills.git
cd academic-shcolar-skills
```

Copy or symlink the four skill folders into a Claude Code project:

```bash
mkdir -p /path/to/project/.claude/skills
ln -s "$PWD/deep-research" /path/to/project/.claude/skills/deep-research
ln -s "$PWD/academic-paper" /path/to/project/.claude/skills/academic-paper
ln -s "$PWD/academic-paper-reviewer" /path/to/project/.claude/skills/academic-paper-reviewer
ln -s "$PWD/academic-pipeline" /path/to/project/.claude/skills/academic-pipeline
```

On Windows, copy the four folders if symlinks are not enabled.

## Codex

Clone the repository:

```bash
git clone https://github.com/crazymsn/academic-shcolar-skills.git
cd academic-shcolar-skills
```

Install the Codex router skill on Windows PowerShell:

```powershell
.\scripts\install-codex-skill.ps1 -Force
```

Install on macOS/Linux:

```bash
./scripts/install-codex-skill.sh --force
```

Restart Codex or open a new conversation, then run:

```text
Use $academic-research-suite to plan a systematic literature review on ...
```

Plain aliases also work in conversation:

```text
ars-plan my paper topic
ars-outline for this research question
ars-full topic: ...
```

## OpenCode

Install OpenCode from the official OpenCode documentation, then clone this
repository:

```bash
git clone https://github.com/crazymsn/academic-shcolar-skills.git
cd academic-shcolar-skills
opencode
```

This repository includes:

- `opencode.json`
- `.opencode/agents/academic-research-suite.md`
- `AGENTS.md`

OpenCode loads the project config from `opencode.json`. The default agent is
`academic-research-suite`, and the following commands are available in the TUI:

```text
/ars-plan
/ars-outline
/ars-abstract
/ars-lit-review
/ars-citation-check
/ars-disclosure
/ars-format-convert
/ars-revision-coach
/ars-revision
/ars-full
```

Headless example:

```bash
opencode run --agent academic-research-suite "ars-plan my paper topic"
```

## Sanity Checks

After installation, check the expected entry point:

- Claude Code: `/plugin` lists `academic-research-skills`, or `/skills` shows
  `deep-research`, `academic-paper`, `academic-paper-reviewer`, and
  `academic-pipeline`.
- Codex: a new conversation recognizes `$academic-research-suite`.
- OpenCode: `opencode` starts in this repository without config errors, and
  `/ars-plan` is available from the command list.

This mirror intentionally does not redistribute upstream GitHub Actions,
third-party HTML snapshots, or showcase PDF binaries.
