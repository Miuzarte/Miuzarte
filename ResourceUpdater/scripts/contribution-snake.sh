#!/bin/bash
set -e

echo "[$(date)] Starting Contribution Snake update..."

OUTPUT_PATH="/app/output/snk"
mkdir -p "$OUTPUT_PATH"

echo "Generating contribution snake SVGs using local snk..."

export SNAKE_LIGHT_COLOR="${SNAKE_LIGHT_COLOR:-#5184F0}"
export SNAKE_LIGHT_DOTS="${SNAKE_LIGHT_DOTS:-#eff2f5,#aceebb,#4ac26b,#2da44e,#116329}"
export SNAKE_DARK_COLOR="${SNAKE_DARK_COLOR:-#E5289E}"
export SNAKE_DARK_DOTS="${SNAKE_DARK_DOTS:-#151b23,#033a16,#196c2e,#2ea043,#56d364}"
export OUTPUT_PATH

cd /snk
bun /app/scripts/generate-snake.js || {
    echo "Failed to generate snake SVGs"
    echo "Creating placeholder files..."

    cat > "$OUTPUT_PATH/snake-light.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="200">
  <text x="50%" y="50%" text-anchor="middle" font-size="16" fill="#666">
    Failed to generate snake animation
  </text>
</svg>
EOF
    cp "$OUTPUT_PATH/snake-light.svg" "$OUTPUT_PATH/snake-dark.svg"
}

echo "[$(date)] Contribution Snake update completed"
