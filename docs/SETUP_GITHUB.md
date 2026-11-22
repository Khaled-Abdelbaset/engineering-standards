# One-time: create GitHub repos

Create **empty** repositories (no README, no .gitignore) under [Khaled-Abdelbaset](https://github.com/Khaled-Abdelbaset):

| Repo | After create |
|------|----------------|
| `engineering-standards` | Public; push this clone + tag `v1.0.0` |
| `template-nest-api` | Public; **Settings → Template repository** ✓ |
| `template-next-app` | Public; **Settings → Template repository** ✓ |

Then from Git Bash:

```bash
bash E:/study/engineering-standards/scripts/push-new-repos.sh
```

Merge `chore/engineering-standards-ci` on backend and frontend **after** `engineering-standards` and `v1.0.0` are on GitHub (CI calls reusable workflow).