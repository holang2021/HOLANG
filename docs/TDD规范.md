# TDD 集成规范

## 红-绿-重构循环

```
🔴 RED: 写一个失败测试 → 运行确认失败
🟢 GREEN: 写最少代码让测试通过 → 运行确认通过
🔵 REFACTOR: 重构代码保持测试通过 → 运行确认仍通过
```

## 测试金字塔

| 层级 | 占比 | 范围 | 工具 |
|------|:---:|------|------|
| 🏔️ E2E | 5% | 关键用户流程 | Playwright / DevTools MCP |
| 🏢 集成 | 15% | API + DB + 服务间 | Supertest / MSW |
| 🧱 单元 | 80% | 函数/类/组件 | Vitest / Jest |

## 覆盖率门禁（硬性阻断）

```
行覆盖 < 80%   → ❌ CI 阻断
分支覆盖 < 70%  → ❌ CI 阻断
核心模块 < 90%  → ❌ CI 阻断
```

## 文件命名约定

```
src/utils/format.ts  →  __tests__/utils/format.test.ts
src/api/user.ts      →  __tests__/api/user.test.ts
```

## 强制 TDD 模块清单

| 模块 | 原因 |
|------|------|
| Bug 状态流转 | 6 阶段状态机，逻辑复杂 |
| 事项关联关系 | 多对多关联，易出 bug |
| 验收结论判定 | 影响上线决策 |
| 严重度自动判定 | P0-P3 判定逻辑 |

## 禁止事项

- ❌ 先写实现再补测试
- ❌ 测试中包含 `setTimeout` / `sleep`
- ❌ 测试依赖执行顺序
- ❌ 跳过覆盖率门禁（`--no-verify` / `--no-coverage`）

## Beyoncé 规则

> "If you liked it then you should have put a test on it"
> — 任何被修复的 Bug，必须有对应的回归测试证明它不会再出现。
