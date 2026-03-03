#!/bin/bash
set -e

echo "[$(date)] Starting GitHub Readme Stats update..."

OUTPUT_PATH="/app/output/grs"

mkdir -p "$OUTPUT_PATH"

echo "Fetching stats SVGs..."
curl -f -o "$OUTPUT_PATH/stats-light.svg" "$STATS_LIGHT_URL" || echo "Failed to fetch stats-light.svg"
curl -f -o "$OUTPUT_PATH/stats-dark.svg" "$STATS_DARK_URL" || echo "Failed to fetch stats-dark.svg"
curl -f -o "$OUTPUT_PATH/topLangs-light.svg" "$LANGS_LIGHT_URL" || echo "Failed to fetch topLangs-light.svg"
curl -f -o "$OUTPUT_PATH/topLangs-dark.svg" "$LANGS_DARK_URL" || echo "Failed to fetch topLangs-dark.svg"

echo "[$(date)] GitHub Readme Stats updated successfully"
