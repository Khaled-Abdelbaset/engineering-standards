# Git & GitHub workflow (Khaled-Abdelbaset org)

**Owner:** [Khaled-Abdelbaset](https://github.com/Khaled-Abdelbaset) (`khaledabdelbaset98@gmail.com`)  
**Canonical home:** [engineering-standards](https://github.com/Khaled-Abdelbaset/engineering-standards) — product repos link here; do not fork this doc per commit.

**Repos:** backend and frontend are **separate** GitHub repositories. Daily work happens in **split clones** (`focus-planner-backend`, `focus-planner-frontend`), not a combined monorepo folder.

**Commit identity:** [GIT_IDENTITY.md](GIT_IDENTITY.md)

---

## 1. Repository model

| Repo | Typical name | Default branch | Stack |
|------|----------------|----------------|--------|
| Backend API | `focus-planner-backend` | `main` | NestJS, Prisma, MySQL |
| Frontend app | `focus-planner-frontend` | `main` | Next.js 15, React |
| Standards | `engineering-standards` | `main` | Docs + reusable Actions |
| Templates | `template-nest-api`, `template-next-app` | `main` | Scaffold + CI wiring |

**Cross-repo contract:** API shape and env vars are the integration surface. Document breaking API changes in the backend PR; frontend PRs that depend on them should link the backend PR and wait for merge/deploy.

---

## 2. Branching (GitHub Flow)

```
main          ← always deployable; protected
  └── feat/…  ← short-lived topic branches
  └── fix/…
  └── chore/…
```

| Branch prefix | Use |
|---------------|-----|
| `feat/<short-name>` | New capability |
| `fix/<short-name>` | Bug fix |
| `chore/<task>` | Tooling, deps, CI, docs |

**Do not** commit directly to `main` (branch protection).

---

## 3. Commits

Use **Conventional Commits**: `feat(backend): …`, `fix(frontend): …`, `chore(ci): …`.

Never commit secrets (`.env`, credentials) or build artifacts (`dist`, `.next`).

---

## 4. Pull request workflow

1. `git fetch origin && git checkout main && git pull && git checkout -b feat/…`
2. Implement + run local checks (§6).
3. Push → open PR → **CI green** → squash merge → delete branch.

PR body: **Summary**, **Test plan**, **Cross-repo** (if any). Template: `templates/pull_request_template.md`.

---

## 5. GitHub branch protection

On `main`: require PR, require **build** check, disallow force push. See [NEW_PROJECT.md](NEW_PROJECT.md).

---

## 6. Quality gates

| Stack | Local |
|-------|--------|
| Backend | `npm ci`, `npx prisma generate`, `npm run build` |
| Frontend | `npm ci`, `npx tsc --noEmit`, `npm run build` |

**CI:** Product repos call [reusable-node-ci.yml](../.github/workflows/reusable-node-ci.yml) from this repo (`@v1.0.0`).

**Discord:** Push/merge to `main` and CI failure notifications — `templates/discord-notify.yml` (per-repo triggers; shared bash/Python payload pattern).

---

## 7. Where to work locally

| Path | Use |
|------|-----|
| `E:\study\focus-planner-backend` | Backend git remote + pushes |
| `E:\study\focus-planner-frontend` | Frontend git remote + pushes |
| `E:\study\engineering-standards` | Handbook + reusable workflows |
| Combined `study-plan/` folder | Optional local mirror only — not the git source of truth |

---

## 8. Release coordination (two repos)

| Scenario | Order |
|----------|--------|
| API breaking change | Backend merge/deploy → then frontend |
| UI-only | Frontend only |

---

## 9. Daily checklist

1. Pull `main` before new work.
2. Branch → commits → push.
3. PR → CI green → squash merge.
4. Note cross-repo dependency in PR when both sides change.

---

## 10. Agents (Cursor)

- Authoritative rules: copy `templates/cursor/git-workflow.mdc` into product repos.
- Do not push/merge without explicit user request.
- Pin reusable workflow version when editing CI.