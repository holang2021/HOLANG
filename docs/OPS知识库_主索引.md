# 🧠 OPS 知识库 — 主索引

> **自动迭代规则：** 新增内容自动归档到对应分类，旧内容被新版本自动标注为过期。
> **调用方式：** Agent 运行时自动读取本索引定位知识条目，无需人工记忆。

---

## 知识库结构

```
OPS知识库/
├── 📐 系统架构/     ← OPS 系统设计、流程定义、模块文档
├── 🔌 API接口/      ← 所有 API 端点、认证方式、调用示例
├── 🛠️ 技能清单/     ← Agent Skills 目录、门禁审计、使用指南
├── 📖 操作手册/     ← 具体操作步骤、故障处理、环境配置
└── 📋 模板库/       ← 所有可复用模板（测试/Bug/验收/复盘/ADR）
```

---

## 一、系统架构

| 文档 | 路径 | 版本 | 状态 |
|------|------|:---:|:---:|
| OPS 六阶段流程定义 | `系统架构/OPS六阶段流程.md` | v1.0 | ✅ |
| Goal 推进模块设计 | `系统架构/Goal推进模块设计.md` | v1.0 | ✅ |
| 资料库目录规范 | `系统架构/资料库使用规范.md` | v1.0 | ✅ |
| 🆕 OPS 命名规范 | `系统架构/OPS命名规范.md` | v1.0 | ✅ |
| 技能门禁审计报告 | `系统架构/技能OPS门禁审计.md` | v1.0 | ✅ |
| 门禁深度复核报告 | `系统架构/门禁深度复核.md` | v1.0 | ✅ |
| 🆕 Goal 需求评估 | `系统架构/GOAL_REQ_OPS-001_20260615.md` | v1.0 | ✅ |
| 🆕 Goal 任务拆解 | `系统架构/GOAL_TASK_v1.0.0_20260615.md` | v1.0 | ✅ |
| 🆕 Goal 结果验证 | `系统架构/GOAL_RESULT_v1.0.0.md` | v1.0 | ✅ |

## 二、API 接口

| 接口 | 用途 | 文档路径 |
|------|------|------|
| GitHub Issues API | 事项创建/查询/关闭 | `API接口/GitHub_Issues_API.md` |
| GitHub Contents API | 文件上传/更新 | `API接口/GitHub_Contents_API.md` |
| GitHub OAuth / PAT | 认证配置 | `API接口/GitHub_认证配置.md` |
| 项目资料库 (tdrive) | 文档存储 | `API接口/项目资料库API.md` |

## 三、技能清单

| 技能 | 分类 | 门禁 | 文档路径 |
|------|:---:|:---:|------|
| browser-testing-with-devtools | 🔍 Chrome侦察 | 🟢 | `技能清单/browser-testing.md` |
| planning-and-task-breakdown | 🎯 Goal推进 | 🟢 | `技能清单/planning-task-breakdown.md` |
| incremental-implementation | 🎯 Goal推进 | 🟢 | `技能清单/incremental-implementation.md` |
| ci-cd-and-automation | 🟢 CI/CD | 🟢 | `技能清单/ci-cd-automation.md` |
| security-and-hardening | 🔒 安全 | 🟢 | `技能清单/security-hardening.md` |
| code-review-and-quality | 🔍 审查 | 🟢 | `技能清单/code-review-quality.md` |
| observability-and-instrumentation | 📊 监控 | 🟢 | `技能清单/observability.md` |
| ... (共50个技能，详见完整清单) | | | `技能清单/完整技能清单.md` |

## 四、操作手册

| 操作 | 触发词 | 文档路径 |
|------|------|------|
| 创建 Bug Issue | "发现Bug"/"报错了" | `操作手册/创建Bug事项.md` |
| 生成测试用例 | "生成测试用例" | `操作手册/生成测试用例.md` |
| 版本验收 | "版本验收"/"上线检查" | `操作手册/版本验收流程.md` |
| 质量复盘 | "做复盘"/"质量回顾" | `操作手册/质量复盘流程.md` |
| GitHub PAT 创建 | "GitHub Token" | `操作手册/GitHub_PAT创建步骤.md` |
| 环境配置 | "环境配置" | `操作手册/环境配置.md` |
| 🆕 团队接入 | "团队怎么接入"/"别人怎么用" | `操作手册/OPS团队接入指南.md` |

## 五、模板库

| 模板 | 用途 | 文档路径 |
|------|------|------|
| 🐛 Bug 反馈模板 | GitHub Issue 模板 | `模板库/bug_report.yml` |
| 🧪 测试用例模板 | 测试用例生成 | `模板库/测试用例生成模板.md` |
| 📋 版本验收模板 | 上线前检查 | `模板库/acceptance.yml` |
| 📊 质量复盘模板 | 版本结束复盘 | `模板库/质量复盘报告模板.md` |
| 🔄 回归测试清单 | 修复后回归 | `模板库/回归测试清单模板.md` |
| 📝 ADR 模板 | 架构决策记录 | `模板库/ADR模板与检查清单.md` |
| 📊 周报模板 | Goal 推进周报 | `模板库/GOAL_WEEKLY模板.md` |
| 🛑 检查点模板 | Phase 检查点 | `模板库/GOAL_CHECKPOINT模板.md` |

---

## 🔄 自动迭代规则

```
新增内容:
  1. 识别分类 → 归入对应目录
  2. 更新本索引（添加条目）
  3. 旧版本内容在文件名后添加 _v{old}.md 后缀

更新内容:
  1. 对比变更
  2. 旧版本 → _v{version}.md 归档
  3. 新版本 → 覆盖原路径
  4. 本索引的"版本"列 +1

调用时:
  1. Agent 读取本索引
  2. 按分类定位知识条目
  3. 读取最新版本内容
```

---

## 六、GitHub Issue 追踪看板

| Issue | Phase | 任务 | 标签 |
|:-----:|:-----:|------|------|
| [#13](https://github.com/holang2021/HOLANG/issues/13) | Phase1 | 测试用例自动生成器 | enhancement |
| [#14](https://github.com/holang2021/HOLANG/issues/14) | Phase1 | 测试资料库建设 | documentation |
| [#15](https://github.com/holang2021/HOLANG/issues/15) | Phase2 | Bug反馈标准化流程 | enhancement |
| [#20](https://github.com/holang2021/HOLANG/issues/20) | Phase2 | Bug 跟踪看板搭建 | infrastructure |
| [#21](https://github.com/holang2021/HOLANG/issues/21) | Phase3 | 日志与接口排查工具链 | tooling |
| [#22](https://github.com/holang2021/HOLANG/issues/22) | Phase3 | 可观测性基础设施 | infrastructure |
| [#16](https://github.com/holang2021/HOLANG/issues/16) | Phase4 | 回归测试自动化 | enhancement |
| [#23](https://github.com/holang2021/HOLANG/issues/23) | Phase4 | CI/CD 质量门禁 | infrastructure |
| [#17](https://github.com/holang2021/HOLANG/issues/17) | Phase5 | 版本验收标准与报告 | enhancement |
| [#24](https://github.com/holang2021/HOLANG/issues/24) | Phase5 | 上线风险管控 | risk |
| [#18](https://github.com/holang2021/HOLANG/issues/18) | Phase6 | 质量复盘报告体系 | enhancement |
| [#19](https://github.com/holang2021/HOLANG/issues/19) | Phase6 | 团队规范沉淀与技能发布 | documentation |

> 📊 **Phase 1-6 全周期覆盖** | **12 个活跃 Issue** | **12 个已完成 (v1.0)**

---
> 📌 **最后更新：** 2026-06-15 | **条目数：** 34 | **版本：** v1.3
