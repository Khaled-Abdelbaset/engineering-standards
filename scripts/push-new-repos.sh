#!/usr/bin/env bash
# Run after creating empty GitHub repos under Khaled-Abdelbaset (no README).
set -euo pipefail

GIT_EMAIL="${GIT_EMAIL:-khaledabdelbaset98@gmail.com}"
GIT_NAME="${GIT_NAME:-Khaled Abdelbaset}"
REMOTE="git@github.com-khaled-abdelbaset:Khaled-Abdelbaset"

push_dir() {
  local dir="$1" repo="$2"
  cd "$dir"
  git remote remove origin 2>/dev/null || true
  git remote add origin "${REMOTE}/${repo}.git"
  git push -u origin main
}

echo "Pushing engineering-standards…"
push_dir "$(dirname "$0")/.." engineering-standards
cd "$(dirname "$0")/.."
git tag -f v1.0.0
git push -f origin v1.0.0

echo "Pushing templates…"
for t in template-nest-api template-next-app; do
  push_dir "E:/study/$t" "$t"
done

echo "Done. Enable Template repository in Settings for both template-* repos."