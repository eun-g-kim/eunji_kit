#!/usr/bin/env bash
# 수동 시연 전에 확인할 최소 항목입니다. 프로젝트별 명령과 URL을 추가하세요.
set -euo pipefail

echo "Smoke-test checklist"
echo "[ ] App starts with the documented command"
echo "[ ] Primary user flow completes end-to-end"
echo "[ ] Empty and invalid inputs show a useful response"
echo "[ ] No secrets are displayed or committed"
