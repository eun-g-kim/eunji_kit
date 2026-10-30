#!/usr/bin/env bash
# 프로젝트에 맞는 정적 검사·테스트 명령을 아래에 추가하세요.
# 대회 전 깨끗한 환경에서 반드시 한 번 실행해 검증합니다.
set -euo pipefail

if [ -f package.json ]; then
  if npm run | grep -qE '^[[:space:]]+lint'; then npm run lint; fi
  if npm run | grep -qE '^[[:space:]]+typecheck'; then npm run typecheck; fi
  if npm run | grep -qE '^[[:space:]]+test'; then npm test -- --run; fi
else
  echo "No package.json found. Add project-specific checks to scripts/check.sh."
fi
