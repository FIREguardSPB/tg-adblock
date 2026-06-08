#!/usr/bin/env bash
# One-shot: create the GitHub repo, push, and trigger the build workflow.
# Run `gh auth login` (or set GH_TOKEN) first. Override defaults via env:
#   REPO=tg-adblock VISIBILITY=public ./publish.sh
set -euo pipefail

GH="${GH:-$HOME/.local/bin/gh}"
REPO="${REPO:-tg-adblock}"
VISIBILITY="${VISIBILITY:-public}"
cd "$(dirname "$0")"

"$GH" auth status >/dev/null 2>&1 || { echo "Not authenticated. Run: $GH auth login   (scopes: repo, workflow)"; exit 1; }

OWNER="$("$GH" api user -q .login)"
echo "Publishing to $OWNER/$REPO ($VISIBILITY)"

if "$GH" repo view "$OWNER/$REPO" >/dev/null 2>&1; then
    git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$OWNER/$REPO.git"
    git push -u origin main
else
    "$GH" repo create "$REPO" --"$VISIBILITY" --source=. --remote=origin --push
fi

"$GH" workflow run build.yml -R "$OWNER/$REPO"
echo "Workflow triggered. Following the run..."
sleep 5
"$GH" run watch -R "$OWNER/$REPO" || true
echo
echo "Releases:"
"$GH" release list -R "$OWNER/$REPO"
