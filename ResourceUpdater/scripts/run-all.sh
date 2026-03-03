#!/bin/bash
set -e

echo "[$(date)] Running all resource update tasks..."

/app/scripts/github-readme-stats.sh

/app/scripts/contribution-snake.sh

echo "[$(date)] All tasks completed"
