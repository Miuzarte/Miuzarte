#!/bin/bash
set -e

echo "[$(date)] Starting GitHub Readme Stats update..."

OUTPUT_PATH="/app/output/grs"

mkdir -p "$OUTPUT_PATH"

echo "Fetching stats SVGs..."

STATS_LIGHT_PATH="$OUTPUT_PATH/stats-light.svg"
STATS_DARK_PATH="$OUTPUT_PATH/stats-dark.svg"
TOP_LANG_LIGHT_PATH="$OUTPUT_PATH/topLangs-light.svg"
TOP_LANG_DARK_PATH="$OUTPUT_PATH/topLangs-dark.svg"

echo "\"$STATS_LIGHT_URL\" -> \"$STATS_LIGHT_PATH\""
curl -f -o "$STATS_LIGHT_PATH" "$STATS_LIGHT_URL" || echo "Failed to fetch stats-light.svg"

echo "\"$STATS_DARK_URL\" -> \"$STATS_DARK_PATH\""
curl -f -o "$STATS_DARK_PATH" "$STATS_DARK_URL" || echo "Failed to fetch stats-dark.svg"

echo "\"$LANGS_LIGHT_URL\" -> \"$TOP_LANG_LIGHT_PATH\""
curl -f -o "$TOP_LANG_LIGHT_PATH" "$LANGS_LIGHT_URL" || echo "Failed to fetch topLangs-light.svg"

echo "\"$LANGS_DARK_URL\" -> \"$TOP_LANG_DARK_PATH\""
curl -f -o "$TOP_LANG_DARK_PATH" "$LANGS_DARK_URL" || echo "Failed to fetch topLangs-dark.svg"

echo "[$(date)] GitHub Readme Stats updated successfully"
