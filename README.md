# Engineering standards (Khaled-Abdelbaset)

Canonical **git workflow**, **reusable GitHub Actions**, and **templates** for product repos (Focus Planner and future projects).

| Resource | Purpose |
|----------|---------|
| [docs/GIT_WORKFLOW.md](docs/GIT_WORKFLOW.md) | Branches, commits, PRs, CI, cross-repo rules |
| [docs/NEW_PROJECT.md](docs/NEW_PROJECT.md) | Checklist: new repo from template, secrets, branch protection |
| [docs/GIT_IDENTITY.md](docs/GIT_IDENTITY.md) | Commit author name/email vs GitHub account |
| [.github/workflows/](.github/workflows/) | Reusable `workflow_call` jobs (pin with `@v1.0.0`) |
| [templates/](templates/) | Copy sources for PR template, Cursor rules, Discord workflow |

## Product repos

- [focus-planner-backend](https://github.com/Khaled-Abdelbaset/focus-planner-backend)
- [focus-planner-frontend](https://github.com/Khaled-Abdelbaset/focus-planner-frontend)

## Use reusable CI

In a product repo `.github/workflows/ci.yml`:

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

## Versioning

Tag releases `v1.x.x` on this repo. Bump the ref in product repos when reusable workflows change.