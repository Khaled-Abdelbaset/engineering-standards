# Git commit identity vs GitHub

GitHub attributes commits to your profile using the **email in the commit**, not the SSH key account you push with.

## Why commits show `@gmail.com` (e.g. innovadigits) instead of Focus Planner mail

Git stores author email in **every commit**. That value comes from:

```bash
git config user.email    # repo-local, else
git config --global user.email
```

If global `user.email` is `khaled.innovadigits@gmail.com`, every commit shows that address—even when you push via `github.com-khaled-abdelbaset` to **Khaled-Abdelbaset** repos.

**GitHub username** on the commit page is whichever GitHub user has that **verified email** (or “unknown” if none).

## Fix (set once on your machine)

Use the email tied to **Khaled-Abdelbaset** (or GitHub’s noreply):

```bash
git config --global user.name "Khaled Abdelbaset"
git config --global user.email "khaledabdelbaset98@gmail.com"
# or GitHub noreply (Settings → Emails → Keep my email addresses private):
# git config --global user.email "ID+khaled-abdelbaset@users.noreply.github.com"
```

Add and verify that email under **GitHub → Settings → Emails** so commits link to the right avatar.

## Per-repo override (work vs personal)

```bash
cd E:/study/focus-planner-backend
git config user.email "khaledabdelbaset98@gmail.com"
```

## One-off commit without changing config

```bash
git -c user.email="khaledabdelbaset98@gmail.com" commit -m "chore: …"
```

## Past commits

Rewriting history is optional; new commits use the new email after you fix config. Do **not** rewrite `main` on shared repos unless the team agrees.