# New project checklist

## 1. Create the repo

**Option A — GitHub template (recommended)**

1. Open [template-nest-api](https://github.com/Khaled-Abdelbaset/template-nest-api) or [template-next-app](https://github.com/Khaled-Abdelbaset/template-next-app).
2. **Use this template** → name the new repo under `Khaled-Abdelbaset`.
3. Clone with SSH host `git@github.com-khaled-abdelbaset:Khaled-Abdelbaset/<repo>.git`.

**Option B — Existing app**

1. Copy `templates/product-ci.yml`, `templates/discord-notify.yml`, `CONTRIBUTING.md` pattern from a template repo.
2. Pin `engineering-standards` at `@v1.0.0` (or latest tag).

## 2. Secrets and integrations

| Secret | Where | Purpose |
|--------|--------|---------|
| `DISCORD_WEBHOOK_URL` | Repo → Settings → Secrets | `#backend` or `#frontend` (or project channel) |

## 3. Branch protection (`main`)

Settings → Branches → Add rule:

- Require pull request before merging (0–1 reviews per team size)
- Require status check: **build** (CI job name)
- Do not allow force push
- (Optional) Require linear history

## 4. Local developer setup

1. Read repo `CONTRIBUTING.md`.
2. Full handbook: [GIT_WORKFLOW.md](GIT_WORKFLOW.md).
3. Set git email: [GIT_IDENTITY.md](GIT_IDENTITY.md).
4. Install [GitHub CLI](https://cli.github.com/) for `gh pr create` (optional).

## 5. Cross-repo APIs (backend + frontend)

See [GIT_WORKFLOW.md §8](GIT_WORKFLOW.md) — merge/deploy backend first on breaking API changes.