---
name: ops-bug-standardizer
description: OPS Bug 标准化器 — 自动补齐Bug缺失字段，判定严重度和优先级。当用户反馈Bug或说报错/有问题/不正常时自动激活。
---

# OPS Bug 标准化器

## 触发词
"Bug"、"报错"、"有问题"、"不正常"、"出bug了"

## 流程
1. 追问缺失字段: 版本/环境/账号/前置条件/复现步骤/实际结果/期望结果
2. 自动判定严重度: 核心功能+阻断=P0, 有workaround=P2, UI=P3
3. 自动判定是否阻断上线
4. 输出标准Bug描述 (Markdown格式)
5. 使用 .github/ISSUE_TEMPLATE/bug_report.yml 创建 GitHub Issue

## 模板
参见 docs/Bug反馈标准化流程.md
