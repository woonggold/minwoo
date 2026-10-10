#!/bin/bash
# 클라우드 세션 시작 시 agent-browser CLI 설치 (.claude/skills/agent-browser 스킬용)
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

if ! command -v agent-browser >/dev/null 2>&1; then
  npm install -g agent-browser
fi

# `agent-browser install`은 Chrome 다운로드 주소가 네트워크 정책에 막혀 실패하므로,
# 컨테이너에 미리 깔린 Playwright Chromium을 쓰도록 지정합니다.
CHROME="$(ls -d /opt/pw-browsers/chromium-*/chrome-linux/chrome 2>/dev/null | sort -V | tail -1 || true)"
if [ -n "$CHROME" ] && [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  {
    echo "export AGENT_BROWSER_EXECUTABLE_PATH=\"$CHROME\""
    echo 'export AGENT_BROWSER_ARGS="--no-sandbox"'
  } >> "$CLAUDE_ENV_FILE"
fi
