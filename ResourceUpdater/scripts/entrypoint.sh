#!/bin/bash
set -e

echo "Starting Resource Updater..."

touch /var/log/cron.log

# 启动时运行一次
echo "Running initial update..."
/app/scripts/run-all.sh

echo "Starting cron daemon..."
echo "" > /var/log/cron.log
cron && tail -f /var/log/cron.log
