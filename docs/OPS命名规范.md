# 📐 OPS 命名规范

> **版本：** v1.0  
> **生效日期：** 2026-06-15  
> **适用范围：** holang2021/HOLANG 仓库全部内容

---

## 一、Skills 命名

```
规则：ops-<功能描述>
分隔符：连字符 (-)
语言：英文小写
```

| Skill | 命名 | 对应阶段 |
|------|------|:---:|
| 流程主控 | `ops-gate` | 全流程 |
| Goal 推进引擎 | `ops-goal-tracker` | 横切 |
| 测试用例生成器 | `ops-test-generator` | Phase 1 |
| Bug 标准化器 | `ops-bug-standardizer` | Phase 2 |
| 回归验证器 | `ops-regression` | Phase 4 |
| 版本验收器 | `ops-acceptance` | Phase 5 |
| 质量复盘器 | `ops-retrospect` | Phase 6 |
| 知识库管理器 | `ops-knowledge-base` | 横切 |

> ❌ 禁止：不带 `ops-` 前缀的技能名称

---

## 二、Issue 命名

```
格式：[PhaseX] 任务描述
```

| 版本 | 格式 | 示例 |
|:---:|------|------|
| ✅ 当前 | `[PhaseX] 任务描述` | `[Phase1] 测试用例自动生成器` |
| ❌ 废弃 | `[Phase X - Task Y] 描述` | `[Phase 1 - Task 1] 事项系统全流程打通` |

**规则：**
- Phase 后**无空格**，与 Label 名一致
- 不使用 `Task Y` 编号（用 Issue 编号 `#N` 代替）
- 描述用中文，简洁明確

---

## 三、Label 命名

```
规则：<作用域>:<分类>
作用域：bug | test | doc | ops | Phase
```

### 3.1 阶段标签

| Label | 含义 |
|------|------|
| `Phase1` | 测试准备 |
| `Phase2` | Bug 反馈 |
| `Phase3` | 研发定位 |
| `Phase4` | 修复验证 |
| `Phase5` | 测试验收 |
| `Phase6` | 质量复盘 |

### 3.2 Bug 严重度

| Label | 含义 |
|------|------|
| `bug:P0` | 阻断上线 |
| `bug:P1` | 严重影响 |
| `bug:P2` | 一般问题 |
| `bug:P3` | 轻微/建议 |

### 3.3 任务类型

| Label | 含义 |
|------|------|
| `enhancement` | 功能增强（GitHub 默认） |
| `documentation` | 文档任务（GitHub 默认） |
| `ops:infrastructure` | 基础设施 |
| `ops:tooling` | 工具链 |
| `ops:risk` | 风险管控 |
| `ops:blocked` | 阻塞状态 |

### 3.4 测试与文档

| Label | 含义 |
|------|------|
| `test:case` | 测试用例 |
| `test:regression` | 回归测试 |
| `doc:report` | 报告文档 |

> ❌ 禁止：裸标签（如 `infrastructure`、`risk`、`tooling`），必须带域名前缀

---

## 四、Goal 产物命名

```
规则：GOAL_<类型>_<标识>_<日期>.md
```

| 类型 | 格式 | 示例 | 触发时机 |
|------|------|------|------|
| 需求评估 | `GOAL_REQ_{编号}_{日期}.md` | `GOAL_REQ_OPS-001_20260615.md` | 新需求进入 |
| 任务拆解 | `GOAL_TASK_{版本}_{日期}.md` | `GOAL_TASK_v1.0.0_20260615.md` | 需求评估通过 |
| 每周报告 | `GOAL_WEEKLY_{年}W{周}.md` | `GOAL_WEEKLY_2026W25.md` | 每周一 09:00 |
| 检查点 | `GOAL_CHECKPOINT_{Phase}_{日期}.md` | `GOAL_CHECKPOINT_Phase1_20260615.md` | Phase 结束时 |
| 结果验证 | `GOAL_RESULT_{版本}.md` | `GOAL_RESULT_v1.0.0.md` | 版本验收通过 |

---

## 五、文件命名

### 5.1 文档 (docs/)

```
规则：中文描述.md
不使用英文、缩写或拼音
```

| ✅ 正确 | ❌ 错误 |
|------|------|
| `测试用例生成模板.md` | `test-case-template.md` |
| `Bug反馈标准化流程.md` | `bug-flow.md` |
| `资料库使用规范.md` | `doc-standard.md` |

### 5.2 配置与脚本

```
配置：小写 + 连字符
脚本：小写 + 连字符
```

| ✅ 正确 | ❌ 错误 |
|------|------|
| `ops-quality-gate.yml` | `OPS_Quality_Gate.yml` |
| `devtools-inspect.sh` | `DevToolsInspect.sh` |
| `plugin.json` | `Plugin.json` |

---

## 六、分支与提交

### 6.1 分支

```
feat/<描述>      — 新功能
fix/<描述>       — 修复
docs/<描述>      — 文档
ops/<描述>       — OPS 系统变更
```

### 6.2 Commit

```
<type>: <简要描述>

类型：
  feat:   新功能
  fix:    修复
  docs:   文档变更
  ops:    OPS 系统变更
  chore:  杂项
```

示例：
- `feat: add OPS quality gate CI/CD pipeline`
- `docs: update 知识库主索引 to v1.2`
- `ops: migrate labels infrastructure→ops:infrastructure`

---

## 七、快速检查清单

| 检查项 | ✅ 通过 | ❌ 不通过 |
|------|:---:|:---:|
| Skill 名是否以 `ops-` 开头？ | `ops-gate` | `gate` |
| Issue 是否用 `[PhaseX]` 格式？ | `[Phase1] xxx` | `[Phase 1 - Task 1] xxx` |
| Label 是否带域名前缀？ | `ops:infrastructure` | `infrastructure` |
| Goal 文件是否用 `GOAL_` 前缀？ | `GOAL_REQ_xxx.md` | `需求评估.md` |
| 文档是否用中文名？ | `测试用例模板.md` | `test-template.md` |
| Commit 是否用 `type:` 前缀？ | `feat: add xxx` | `add xxx` |

---

> 📌 **最后更新：** 2026-06-15 | **版本：** v1.0 | **关联：** OPS知识库_主索引.md
