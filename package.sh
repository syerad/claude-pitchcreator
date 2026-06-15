#!/usr/bin/env bash
# Package the skill as a distributable .skill file — a zip archive whose
# single top-level folder is the skill, with SKILL.md at its root. Output
# goes to dist/ (gitignored); rebuild any time the skill changes.
set -euo pipefail
cd "$(dirname "$0")"

SKILL=shape-up-pitch
mkdir -p dist
rm -f "dist/$SKILL.skill"
( cd skills && zip -r -X "../dist/$SKILL.skill" "$SKILL" -x '*.DS_Store' )

echo
echo "Built dist/$SKILL.skill:"
unzip -l "dist/$SKILL.skill"
