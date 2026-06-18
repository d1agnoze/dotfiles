#!/bin/bash
# ./tmp/auto-merge.sh
# Creates and merges a PR to 'dev' with an AI generated message based on commits.

set -e

# Ensure required CLIs are installed
if ! command -v opencode &> /dev/null; then
  echo "❌ OpenCode CLI not found. Please install it first."
  exit 1
fi
if ! command -v gh &> /dev/null; then
  echo "❌ GitHub CLI (gh) not found. Please install it first."
  exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" = "dev" ]; then
  echo "⚠️ You are already on 'dev' branch. Please checkout a feature branch."
  exit 1
fi

git fetch origin
echo "🤖 Generating PR message using OpenCode CLI (big pickle)..."
PR_MESSAGE=$(opencode run -m "opencode/big-pickle" --format json "Write a pull request body in plain text for merging branch '$CURRENT_BRANCH' into 'dev'. Base it on the git commits and diff between '$CURRENT_BRANCH' and 'origin/dev'. Return only the PR body with a short summary and bullet points for the most important changes." | jq -r '.content // .text // .message // .')

# Create PR to 'dev' with generated message using gh CLI
PR_URL=$(gh pr create --base dev --title "Auto PR: $CURRENT_BRANCH" --body "$PR_MESSAGE")
if [ -z "$PR_URL" ]; then
  echo "❌ Failed to create PR."
  exit 1
fi

echo "✅ Pull request created: $PR_URL"

echo "🔀 Merging PR..."
gh pr merge --delete-branch --squash "$PR_URL"

echo "🎉 Pull request merged."
