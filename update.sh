#!/bin/bash
# 筋斗云看板自动更新脚本
# 用法: ./update.sh

KANBAN_DIR="$(dirname "$0")"
cd "$KANBAN_DIR"

# 如果有变更就提交推送
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "看板更新 $(date '+%m-%d %H:%M')"
  git push origin main 2>/dev/null
  echo "✅ 看板已更新并推送"
else
  echo "ℹ️ 看板无变更"
fi
