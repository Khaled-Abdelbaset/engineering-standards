# Agent instructions (Claude Code, Cursor, others)

**Goal:** Anyone cloning a repo gets the same **git, quality gates, and commands** whether they use Claude Code, Cursor, or another coding agent.

**Canonical human handbook:** [GIT_WORKFLOW.md](GIT_WORKFLOW.md) (full policy). **Do not** duplicate the whole handbook in agent files.

---

## Layered layout (per product repo)

| File / path | Tools | Purpose |
|-------------|--------|---------|
| **`AGENTS.md`** (repo root) | Claude Code (default), many agents | **Short** project instructions: commands, git/PR essentials, links to handbook (~&lt;120 lines) |
| **`CLAUDE.md`** (optional) | Claude Code | Thin entry; **import** `AGENTS.md` via `@AGENTS.md` so one source of truth |
| **`.cursor/rules/*.mdc`** | Cursor | `alwaysApply` + `globs`; mirror slices of `AGENTS.md` (Cursor does not load `.claude/rules` as rules) |
| **`.claude/rules/*.md`** | Claude Code | Optional path-scoped rules; git policy file with no `paths` loads at session start |
| **`docs/*-TRACKER.md`** | All | Large multi-phase work (e.g. UI refactor): one branch + one PR per phase |
| **Skills** | Claude / Cursor | Multi-step procedures only (release, scaffold)—not basic git law |

**Personal prefs:** `CLAUDE.local.md` / Cursor user rules — **gitignored**, not committed.

---

## Authoring rules

1. **Signal density:** exact install, typecheck, build commands; branch prefixes; what never to commit.
2. **Link out** for long policy: `engineering-standards` URLs, repo `CONTRIBUTING.md`.
3. **One concern per rule file** in `.cursor/rules` and `.claude/rules` (git vs stack vs domain).
4. **Enforcement** (must run typecheck, block force-push) → CI and branch protection, not hopeful prose.
5. **Update together:** change handbook first, then `AGENTS.md`, then Cursor/Claude rule mirrors in the same PR when behavior changes.

---

## New repo bootstrap

From [NEW_PROJECT.md](NEW_PROJECT.md):

1. Copy bundle from `engineering-standards/templates/`:
   - `AGENTS.md` → pick `templates/agents/AGENTS.next.md` or `AGENTS.nest.md`
   - `CLAUDE.md` → `templates/CLAUDE.md`
   - `.claude/rules/git-workflow.md` → `templates/claude/rules/git-workflow.md`
   - `.cursor/rules/git-workflow.mdc` → `templates/cursor/git-workflow.mdc`
2. Add stack rule (Next/Nest) from template repo or product repo.
3. Commit on `main` via PR (or include in initial template generation).

**Templates** [template-next-app](https://github.com/Khaled-Abdelbaset/template-next-app) and [template-nest-api](https://github.com/Khaled-Abdelbaset/template-nest-api) already ship this bundle.

---

## Large initiatives (multi-phase)

See [GIT_WORKFLOW.md §11](GIT_WORKFLOW.md#11-large-initiatives-multi-phase-work).

- Tracker doc in the repo (`docs/*-TRACKER.md`).
- **One phase → one branch → one PR**; commit when the phase passes local gates.
- Stack PRs (phase 2 base = phase 1 branch) or merge sequentially and retarget to `main`.

---

## References

- [Claude Code: CLAUDE.md / AGENTS.md](https://code.claude.com/docs/en/memory)
- [Claude Code: `.claude` directory](https://code.claude.com/docs/en/claude-directory)
- [Cursor: project rules](https://cursor.com/docs/context/rules)