#!/bin/bash
set -e

export BUN_DIR="/root/.bun"
export PATH="$BUN_DIR/bin:$PATH"

echo "[$(date)] Running all resource update tasks..."

/app/scripts/github-readme-stats.sh

/app/scripts/contribution-snake.sh

echo "[$(date)] All tasks completed"
