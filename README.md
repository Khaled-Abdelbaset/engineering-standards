# Engineering standards

Central **process documentation** and **reusable GitHub Actions** for repositories under [Khaled-Abdelbaset](https://github.com/Khaled-Abdelbaset). Focus Planner and new projects pin workflow versions from here.

[![Reusable CI](https://img.shields.io/badge/workflow-reusable--node--ci-blue)](.github/workflows/reusable-node-ci.yml)

---

## What lives here

| Path | Description |
|------|-------------|
| [docs/GIT_WORKFLOW.md](docs/GIT_WORKFLOW.md) | Branching, commits, PRs, cross-repo order, quality gates |
| [docs/NEW_PROJECT.md](docs/NEW_PROJECT.md) | New repo checklist (secrets, branch protection, templates) |
| [docs/GIT_IDENTITY.md](docs/GIT_IDENTITY.md) | Git author email vs GitHub account |
| [docs/SETUP_GITHUB.md](docs/SETUP_GITHUB.md) | One-time publish / push notes |
| [.github/workflows/reusable-node-ci.yml](.github/workflows/reusable-node-ci.yml) | `workflow_call` — Nest (`flavor: nest`) or Next (`flavor: next`) |
| [templates/](templates/) | PR template, Discord notify YAML, Cursor rule, `CONTRIBUTING` stub |

---

## Product repositories

| Repo | Role |
|------|------|
| [focus-planner-backend](https://github.com/Khaled-Abdelbaset/focus-planner-backend) | NestJS API |
| [focus-planner-frontend](https://github.com/Khaled-Abdelbaset/focus-planner-frontend) | Next.js UI |

## Starter templates

| Template | Use |
|----------|-----|
| [template-nest-api](https://github.com/Khaled-Abdelbaset/template-nest-api) | New Nest + Prisma service |
| [template-next-app](https://github.com/Khaled-Abdelbaset/template-next-app) | New Next.js app |

GitHub → **Use this template** on either template repo to create a new project with CI already wired.

---

## Consume reusable CI

In your repo `.github/workflows/ci.yml`:

```yaml
name: CI
on:
  pull_request:
    branches: [main]
  push:
    branches: [main]
jobs:
  build:
    uses: Khaled-Abdelbaset/engineering-standards/.github/workflows/reusable-node-ci.yml@v1.0.0
    with:
      flavor: nest   # or: next
```

**Nest** runs: `npm ci` → `prisma generate` → `prisma validate` → `npm run build` (with CI `DATABASE_URL`).

**Next** runs: `npm ci` → `tsc --noEmit` → `npm run build`.

---

## Versioning

| Tag | Meaning |
|-----|---------|
| `v1.0.0` | Current reusable CI contract |

When this repo changes workflows, tag `v1.x.x` and bump the ref in product repos in a dedicated PR.

---

## Who should read this

- **Developers** — before first commit: [GIT_WORKFLOW.md](docs/GIT_WORKFLOW.md) + [GIT_IDENTITY.md](docs/GIT_IDENTITY.md)
- **Maintainers** — new repo: [NEW_PROJECT.md](docs/NEW_PROJECT.md)
- **Agents / Cursor** — [templates/cursor/git-workflow.mdc](templates/cursor/git-workflow.mdc)

---

## Contributing

This repo is the source of truth for org process. Change via PR to `main`; announce tag bumps to dependent repos.

---

## License

Private / internal use.