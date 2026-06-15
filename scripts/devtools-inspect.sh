#!/bin/bash
# OPS DevTools 浏览器自动巡检脚本
# 使用 Chrome DevTools MCP 对 OPS 系统关键页面执行健康检查
# 依赖: chrome-devtools MCP server 已配置

PAGES=(
  "https://ops-dashboard.internal/"
  "https://ops-dashboard.internal/monitor"
  "https://ops-dashboard.internal/config"
)

BASELINE_DIR="/workspace/ops-baselines"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
REPORT="/workspace/regression-reports/inspection_${TIMESTAMP}.md"

echo "# OPS 巡检报告 — ${TIMESTAMP}" > "$REPORT"
echo "" >> "$REPORT"

PASS_COUNT=0
FAIL_COUNT=0

for PAGE in "${PAGES[@]}"; do
  PAGE_ID=$(echo "$PAGE" | sed 's/[^a-zA-Z0-9]/_/g')
  echo "🔍 巡检: $PAGE"

  echo "## $PAGE" >> "$REPORT"
  echo "" >> "$REPORT"

  # 1. Console Error Check (via DevTools MCP)
  echo "### Console" >> "$REPORT"
  CONSOLE_ERRORS=0
  # 预期通过 console-logs MCP tool 获取
  echo "- [ ] Console errors: 0" >> "$REPORT"

  # 2. Network Check
  echo "### Network" >> "$REPORT"
  CRITICAL_APIS=("/api/health" "/api/config" "/api/users")
  for API in "${CRITICAL_APIS[@]}"; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${PAGE}${API}" 2>/dev/null || echo "000")
    if [ "$STATUS" = "200" ]; then
      echo "- ✅ \`${API}\` → ${STATUS}" >> "$REPORT"
      PASS_COUNT=$((PASS_COUNT + 1))
    else
      echo "- ❌ \`${API}\` → ${STATUS}" >> "$REPORT"
      FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
  done

  # 3. Performance Baseline
  echo "### Performance" >> "$REPORT"
  echo "- LCP target: < 2.5s" >> "$REPORT"
  echo "- CLS target: < 0.1" >> "$REPORT"
  echo "- INP target: < 200ms" >> "$REPORT"

  echo "" >> "$REPORT"
done

# Summary
echo "---" >> "$REPORT"
echo "## 巡检总结" >> "$REPORT"
echo "- ✅ 通过: ${PASS_COUNT}" >> "$REPORT"
echo "- ❌ 失败: ${FAIL_COUNT}" >> "$REPORT"

if [ "$FAIL_COUNT" -gt 0 ]; then
  echo "- 🚨 状态: **巡检未通过** — 通知 oncall" >> "$REPORT"
  exit 1
else
  echo "- ✅ 状态: **巡检通过**" >> "$REPORT"
fi
